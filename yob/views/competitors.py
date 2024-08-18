import os
from datetime import datetime

from flask import render_template, g, request, jsonify, abort, redirect, url_for, flash

from yob import app, config
from yob.login_manage import roles_required
from yob.repositories.competition_repository import get_competition_by_id
from yob.repositories.competitors_repository import get_competitor_by_id, get_competitors_by_competition_id, \
    update_competitor, create_competitor, delete_competitor
from yob.views.profile import allowed_file, get_hashed_filename, read_file_extension


@app.route('/competition/<int:competition_id>/competitors')
@roles_required('admin', 'scrutineer')
def competitors_manage(competition_id):
    '''Display all competitors of a competition'''
    competition = get_competition_by_id(competition_id)
    if not competition:
        abort(404, description=f"Competition with id {competition_id} not found!")
    competitors = get_competitors_by_competition_id(competition_id)
    return render_template('competitors/competitors_mgmt.html', competition=competition, competitors=competitors,
                           can_edit=can_edit(competition))


@app.route('/competitor/edit/<int:competitor_id>', methods=['GET', 'POST'])
@roles_required('admin')
def competitor_edit(competitor_id):
    '''Edit a competitor'''

    # Check if competitor exists
    competitor = get_competitor_by_id(competitor_id)
    if not competitor:
        abort(404, description=f"Competitor with id {competitor_id} not found!")

    # Check if competition exists
    competition = get_competition_by_id(competitor['competition_id']);
    if not competition:
        abort(404, description=f"Competition with id {competitor['competition_id']} not found!")

    # Check if the competition is ongoing or approved
    now = datetime.now()
    if competition['status'] in ('finished', 'approved'):
        flash('You cannot edit a competitor in an approved competition.', 'danger')
        return render_template('competitors/competitor_edit.html', competitor=competitor, view=True)
    elif competition['start_date'] < now and competition['end_date'] > now:
        flash('You cannot edit a competitor in an ongoing competition.', 'danger')
        return render_template('competitors/competitor_edit.html', competitor, view=True)

    if request.method == 'POST':
        # Form submission logic
        name = request.form['name']
        description = request.form['description']
        author = request.form['author']
        image = request.files['image']

        if not name or not description or not author:
            flash('All fields are required.', 'danger')
            return render_template('competitors/competitor_edit.html', competitor=competitor)

        if image and image.filename != '':
            if allowed_file(image.filename):
                # Hash file with md5 to generate unieq filename, avoding filename conflict
                filename = get_hashed_filename(image, read_file_extension(image.filename))
                file_path = os.path.join(app.config['COMPETITOR_IMAGES_ABS_PATH'], filename)
                if os.path.exists(file_path):
                    image.close()
                else:
                    image.save(file_path)
                file_url = f'/{config.DEFAULT_COMPETITOR_IMAGES_FOLDER}/{filename}'
                competitor['image'] = file_url
            else:
                flash('Image format is not allowed.', 'danger')
                return render_template('competitors/competitor_edit.html', competitor=competitor)

        # Update competitor details
        competitor['name'] = name
        competitor['description'] = description
        competitor['author'] = author

        # Save competitor to the database
        update_competitor(competitor)
        flash('Competitor saved successfully.', 'success')
        return redirect(url_for('competitors_manage', competition_id=competitor['competition_id']))

    return render_template('competitors/competitor_edit.html', competitor=competitor)


@app.route('/competition/<int:competition_id>/competitor/new', methods=['GET', 'POST'])
@roles_required('admin')
def competitor_new(competition_id):
    '''Create a new competitor'''

    # Check if competition exists
    competition = get_competition_by_id(competition_id);
    if not competition:
        abort(404, description=f"Competition with id {competition_id} not found!")
    competitor = {'competition_id': competition_id}

    # Check if the competition is finished or approved
    now = datetime.now()
    if competition['status'] in ('finished', 'approved'):
        flash('You cannot create a competitor for an approved competition.', 'danger')
        return render_template('competitor_edit.html', competitor=competitor)
    elif competition['start_date'] < now and competition['end_date'] > now:
        flash('You cannot create a competitor for an ongoing competition.', 'danger')
        return render_template('competitor_edit.html', competitor)

    if request.method == 'POST':
        # Form submission logic
        name = request.form['name']
        description = request.form['description']
        author = request.form['author']
        image = request.files['image']

        if not name or not description or not author or not image:
            flash('All fields are required.', 'danger')
            return render_template('competitor_edit.html', competitor=competitor)

        if image and allowed_file(image.filename):
            # Hash file with md5 to generate unieq filename, avoding filename conflict
            filename = get_hashed_filename(image, read_file_extension(image.filename))
            file_path = os.path.join(app.config['COMPETITOR_IMAGES_ABS_PATH'], filename)
            if os.path.exists(file_path):
                image.close()
            else:
                image.save(file_path)
            file_url = f'/{config.DEFAULT_COMPETITOR_IMAGES_FOLDER}/{filename}'
            competitor['image'] = file_url
        else:
            flash('Image format is not allowed.', 'danger')
            return render_template('competitor_edit.html', competitor=competitor)

        # Update competitor details
        competitor['competition_id'] = competition_id
        competitor['name'] = name
        competitor['description'] = description
        competitor['author'] = author
        competitor['create_by'] = g.user['user_id']
        competitor['status'] = 'attending'

        # Save competitor to the database
        create_competitor(competitor)
        flash('Competitor saved successfully.', 'success')
        return redirect(url_for('competitors_manage', competition_id=competition_id))
    return render_template('competitors/competitor_edit.html', competitor=competitor)


@app.route('/competitor/delete/<int:competitor_id>', methods=['DELETE'])
@roles_required('admin')
def competitor_delete(competitor_id):
    '''Delete a competitor'''

    # Check if competitor exists
    competitor = get_competitor_by_id(competitor_id)
    if not competitor:
        abort(404, description=f"Competitor with id {competitor_id} not found!")

    # Check if competition exists
    competition = get_competition_by_id(competitor['competition_id'])
    if not competition:
        abort(404, description=f"Competition with id {competitor['competition_id']} not found!")

    # Check if the competition is finished or approved
    now = datetime.now()
    if competition['status'] in ('finished', 'approved'):
        return jsonify({'success': False, 'message': 'You cannot delete a competitor of an finished competition.'})
    elif competition['start_date'] < now and competition['end_date'] > now:
        return jsonify({'success': False, 'message': 'You cannot delete a competitor of an ongoing competition.'})

    delete_competitor(competitor_id)
    flash('Competitor deleted successfully.', 'success')

    return jsonify({'success': True})


@app.route('/competitor/view/<int:competitor_id>')
def competitor_view(competitor_id):
    '''View a competitor'''
    competitor = get_competitor_by_id(competitor_id)
    if not competitor:
        abort(404, description=f"Competitor with id {competitor_id} not found!")
    return render_template('competitors/competitor_view.html', competitor=competitor)


def can_edit(competition):
    """Determine if a competition can be edited"""
    now = datetime.now()
    if competition['status'] == 'approved':
        return False
    elif competition['start_date'] < now:
        return False
    return True
