# ENGAGING WITH COMPETITIONS
from flask import render_template, abort

from yob import app
from yob.repositories.competition_repository import get_competition_by_id
from yob.repositories.competitors_repository import get_competitors_with_votes_percentage
from yob.utility import get_current_datetime


@app.route('/competition/view/<int:competition_id>')
def competition_view(competition_id):
    """Return the competition view page"""
    competition = get_competition_by_id(competition_id)
    if not competition:
        abort(404, description=f"Competition with id {competition_id} not found!")
    (status, status_message) = get_competition_status(competition)
    return render_template('competitions/competition_view.html', competition=competition, status=status, status_message=status_message)


@app.route('/competition/result/<int:competition_id>')
def competition_result(competition_id):
    """Return the result page of approved competition"""
    competition = get_competition_by_id(competition_id)
    if not competition:
        abort(404, description=f"Competition with id {competition_id} not found!")
    if competition['status'] != 'approved':
        abort(403, description="This competition has not been approved!")

    competitors = get_competitors_with_votes_percentage(competition_id)
    if not competitors or len(competitors) == 0:
        abort(400, description="No competitor found in this competition!")

    winner = competitors[0]
    return render_template('competitions/competition_result.html', competition=competition, competitors=competitors, winner=winner)


def get_competition_status(competition):
    """Determine the status and status tooltip by combining fields of stauts and date"""
    if competition['status'] == 'approved':
        return competition['status'], "The result of competition has been approved!"
    now = get_current_datetime()
    if competition['start_date'] > now:
        return 'in plan', "This competition has not started!"
    elif competition['status'] in ('finished', 'approved') or competition['end_date'] < now:
        return 'finished', "This competition has finished!"
    elif competition['start_date'] < now < competition['end_date']:
        return 'on going', "This competition is on going!"
