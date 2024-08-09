# ENGAGING WITH COMPETITIONS
from flask import render_template, g, request, jsonify, abort, redirect, url_for, flash
from yob.repositories.competition_repository import get_competition_by_id
from yob import app
from yob.utility import get_current_datetime


@app.route('/competition/manage')
def competition_manage():
    return render_template('competitions/competion_mgmt.html')


@app.route('/competition/edit/<int:competition_id>')
def competition_edit(competition_id):
    return render_template('competitions/competion_edit.html')


@app.route('/competition/view/<int:competition_id>')
def competition_view(competition_id):
    """Return the competition view page"""
    competition = get_competition_by_id(competition_id)
    if not competition:
        abort(404, description=f"Competition with id {competition_id} not found!")
    (status, status_message) = get_competition_status(competition)
    return render_template('competitions/competition_view.html', competition=competition, status=status, status_message=status_message)


def get_competition_status(competition):
    """Determine the status and status tooltip by combining fields of stauts and date"""
    if competition['status'] == 'approved':
        return competition.status, "The result of competition has been approved!"
    now = get_current_datetime()
    if competition['start_date'] > now:
        return 'in plan', "This competition has not started!"
    elif competition['status'] in ('finished', 'approved') or competition['end_date'] < now:
        return 'finished', "This competition has finished!"
    elif competition['start_date'] < now and competition['end_date'] > now:
        return 'on going', "This competition is on going!"
