import os

from PIL import Image
from flask import redirect, request, flash, render_template, url_for
from werkzeug.utils import secure_filename

from yob import app
from yob.config import DEFAULT_PROFILE_IMAGE
from yob.decorators import login_required, owner_required
from yob.repositories.profile_image_repository import handle_profile_image_update
from yob.repositories.users_repository import get_user_by_id
from yob.utility import random_string


@app.route('/profile_image/<int:user_id>', methods=['GET', 'POST'])
@login_required
@owner_required
def profile_image(user_id):
    '''Handle profile image updates'''
    if request.method == 'POST':
        if request.form.get('action', '') == 'delete':
            # Delete existing image
            delete_profile_image(user_id)
            handle_profile_image_update(user_id)
            flash("Profile Image deleted successfully", "success")
            return redirect(url_for('profile', user_id=user_id))
        
        # Handle image upload
        else:
            if 'image' not in request.files:
                flash('No image uploaded', 'danger')
                return redirect(url_for('profile', user_id=user_id))
            file = request.files['image']
            if not file or not file.filename:
                flash('No image uploaded', 'danger')
                return redirect(url_for('profile', user_id=user_id))
            # Validate the file type
            file_type = file.content_type
            if file_type not in ['image/jpeg', 'image/png']:
                flash('Invalid image file type. Only jpeg, png are allowed.')
                return render_template("user/profile_image.html", user=get_user_by_id(user_id))
            # Delete existing image
            delete_profile_image(user_id)
            # Save the new image
            profile_path = save_profile_image(file)
            handle_profile_image_update(user_id, profile_path)
            flash("Profile Image updated successfully", "success")
            return redirect(url_for('profile', user_id=user_id))
    return render_template("user/profile_image.html", user=get_user_by_id(user_id))


def save_profile_image(file):
    '''Save the profile image to the specified directory'''
    dir_path = os.path.dirname(os.path.realpath(__file__))
    # Open the image file
    image = Image.open(file)
    # Convert the image to RGB if it has an alpha channel (e.g., PNG)
    if image.mode in ("RGBA", "LA") or (image.mode == "P" and "transparency" in image.info):
        image = image.convert("RGB")
    # Resize the image to 512x512
    image = image.resize((512, 512))
    # Save the image to the specified directory as JPEG with a secure random filename
    secured_random_filename = secure_filename(f'{random_string(64)}.jpg')
    image_path = os.path.join(app.config['PROFILE_IMAGES_ABS_PATH'], secured_random_filename)
    image.save(image_path, format='JPEG')
    return secured_random_filename


def delete_profile_image(user_id):
    '''Delete the profile image of the specified user'''
    user = get_user_by_id(user_id)
    # Skip deleting default profile image
    if user['profile_image'] == DEFAULT_PROFILE_IMAGE:
        return
    try:
        file_path = os.path.join(app.root_path, user['profile_image'])
        # Delete the image file
        if os.path.exists(file_path):
            os.remove(file_path)
    # Handle exceptions
    except Exception as e:
        flash(f"An error occurred while trying to delete the image: {str(e)}", "danger")
