# COMPETITION SETUP
import os

from flask import render_template, redirect, abort, url_for, flash, request, jsonify, g

from yob import app, config
from yob.decorators import login_required, admin_required
from yob.repositories.competition_repository import get_all_competitions, get_competition_by_id, delete_competition, \
    Competition, create_competition
from yob.repositories.competitions_mgmt_repository import update_competition_image_update
from yob.utility import are_fields_present
from yob.views.profile import allowed_file, get_hashed_filename, read_file_extension


@app.route('/competitions')
@login_required
@admin_required
def competitions_mgmt():
    # Render the admin home page with user information
    competitions = get_all_competitions()
    competitions.reverse()
    return render_template('competitions/competitions_mgmt.html', competitions=competitions)


@app.route('/competition/create', methods=['POST'])
@login_required
@admin_required
def competition_create():
    # Render the admin home page with user information
    if 'image' not in request.files:
        return jsonify(success=False, error='No file part')
    file = request.files['image']
    if file.filename == '':
        return jsonify(success=False, error='No selected file')
    if file and allowed_file(file.filename):
        # Hash file with md5 to generate unique filename, avoiding filename conflict
        filename = get_hashed_filename(file, read_file_extension(file.filename))
        file_path = os.path.join(app.config['COMPETITION_IMAGES_ABS_PATH'], filename)
        if os.path.exists(file_path):
            file.close()
        else:
            file.save(file_path)
        file_url = f'/{config.DEFAULT_COMPETITION_IMAGES_FOLDER}/{filename}'
        if are_fields_present(request, ['name', 'description', 'start_date', 'end_date']):
            competition = Competition(request.form['name'], request.form['description'], file_url,
                                      request.form['start_date'],
                                      request.form['end_date'], config.DEFAULT_COMPETITION_STATUS, g.user['user_id'])
            create_competition(competition)
        return redirect(url_for('competitions_mgmt'))

    return jsonify(success=False, error='File not allowed')


@app.route('/competition/manage')
@login_required
@admin_required
def competition_manage():
    return render_template('competitions/competition_mgmt.html')


@app.route('/competition/edit/<int:competition_id>')
@login_required
@admin_required
def competition_edit(competition_id):
    if request.method == 'POST':
        # verify form
        if are_fields_present(request, ['name', 'description', 'image', 'start_date', 'end_date']):
            pass
    else:
        competition = get_competition_by_id(competition_id)
        return render_template('competitions/competition_edit.html', competition=competition)


@app.route('/competition/delete/<int:competition_id>', methods=['POST'])
@login_required
@admin_required
def competition_delete(competition_id):
    if delete_competition(competition_id):
        flash("Competition deleted successfully", "success")
        return redirect(url_for('competitions_mgmt', deleted_competition_id=competition_id))
    else:
        abort(403, description=f"Filed to delete the Competition with id {competition_id}!")


@app.route('/competition/competition_image', methods=['DELETE'])
@login_required
def delete_competition_image():
    """Delete profile image for user"""
    profile_image = config.DEFAULT_COMPETITION_IMAGE
    update_competition_image_update(g.user['user_id'], profile_image)
    return jsonify(success=True, profile_image=profile_image)
