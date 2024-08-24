import hashlib
import os
import re

from flask import request, flash, render_template, g, jsonify

from yob import app, config
from yob.login_manage import login_required
from yob.repositories import users_repository


@app.route('/user/<int:user_id>', methods=['GET', 'POST'])
@login_required
def profile(user_id):
    """edit or view user profile"""
    user = users_repository.get_user_by_id(user_id)
    if not user:
        raise ValueError(r'User(user_id={user_id}) not found')
    if request.method == 'POST':
        # Get form data
        email = request.form['email']
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        location = request.form['location']
        description = request.form['description']
        editable = user['user_id'] == g.user['user_id'] or g.user['role'] in ['admin', 'scrutineer']

        # Validate email format
        if email != user['email']:
            if not re.match(config.EMAIL_REGEX, email):
                flash("Invalid email format", 'danger')
                return render_template('user/profile.html', user=user, editable=editable)

            exist_user = users_repository.get_user_by_email(email)
            if exist_user and exist_user['user_id'] != user_id:
                flash("This email already exists.", 'danger')
                return render_template('user/profile.html', user=user, editable=editable)

            user['email'] = email
        # User can only modify self infomations
        if g.user['user_id'] == user['user_id']:
            user['first_name'] = first_name
            user['last_name'] = last_name
            user['location'] = location
            user['description'] = description

        # Only admin and scrutineer can change role and status, and can not change himself role and status
        if g.user['role'] in ['admin', 'scrutineer'] and user['user_id'] != g.user['user_id']:
            # Role for voter can not be changed
            if user['role'] != 'voter':
                user['role'] = request.form['role']
            user['status'] = request.form['status']
        users_repository.update_user(user)
        flash('Profile updated successfully!', 'success')

    editable = user['user_id'] == g.user['user_id'] or g.user['role'] == 'admin' or g.user['role'] == 'scrutineer'
    # scrutineer can not manage other scrutineers
    if user['role'] == 'scrutineer' and g.user['role'] == 'scrutineer' and user['user_id'] != g.user['user_id']:
        editable = False
    # scrutineer can not manage admin user
    if user['role'] == 'admin' and g.user['role'] == 'scrutineer':
        editable = False
    return render_template('user/profile.html', user=user, editable=editable)


@app.route('/user/profile_image', methods=['POST'])
@login_required
def upload_profile_image():
    """Upload profile image for user"""
    if 'profile_image' not in request.files:
        return jsonify(success=False, error='No file part')

    file = request.files['profile_image']
    if file.filename == '':
        return jsonify(success=False, error='No selected file')

    if file and allowed_file(file.filename):
        # Hash file with md5 to generate unieq filename, avoding filename conflict
        filename = get_hashed_filename(file, read_file_extension(file.filename))
        file_path = os.path.join(app.config['PROFILE_IMAGES_ABS_PATH'], filename)
        if os.path.exists(file_path):
            file.close()
        else:
            file.save(file_path)
        file_url = f'/{config.DEFAULT_PROFILE_IMAGES_FOLDER}/{filename}'
        users_repository.update_profile_image(g.user['user_id'], file_url)
        return jsonify(success=True, profile_image=file_url)

    return jsonify(success=False, error='Image format is not allowed')


@app.route('/user/profile_image', methods=['DELETE'])
@login_required
def delete_profile_image():
    """Delete profile image for user"""
    profile_image = config.DEFAULT_PROFILE_IMAGE
    users_repository.update_profile_image(
        g.user['user_id'], profile_image)
    return jsonify(success=True, profile_image=profile_image)


def allowed_file(filename):
    """Validate profile image extension"""
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in config.ALLOWED_EXTENSIONS


def calculate_md5_hash(file):
    """Calculate the MD5 hash of a file-like object."""
    hasher = hashlib.md5()
    while chunk := file.read(8192):
        hasher.update(chunk)
    # Reset the file pointer to the beginning after reading
    file.seek(0)
    return hasher.hexdigest()


def read_file_extension(filename):
    '''Read file extension'''
    return filename.rsplit('.', 2)[1].lower()


def get_hashed_filename(file, extension):
    '''Generate hashed filename'''
    return calculate_md5_hash(file) + '.' + extension
