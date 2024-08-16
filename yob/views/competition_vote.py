from datetime import datetime

from flask import render_template, g, request, jsonify, abort

from yob import app
from yob.config import DEFAULT_VOTE_STATUS, PERMITTED_VOTE_ROLES, MAX_TICKETS_PER_COMPETITION
from yob.login_manage import login_required, roles_required
from yob.repositories.competition_repository import get_competition_by_id
from yob.repositories.competitors_repository import get_competitors_and_votes, get_competitor_by_id
from yob.repositories.votes_repository import get_votes_by_competition_and_user, create_vote
from yob.utility import get_current_datetime


@app.route('/competition/vote/<int:competition_id>', methods=['GET'])
def competition_vote(competition_id):
    """The page view of vote for a competition"""
    competition = get_competition_by_id(competition_id)
    if not competition:
        raise ValueError(f"competition with id {competition_id} not found")
    competitors = get_competitors_and_votes(competition_id, g.user['user_id'])
    my_votes = get_votes_by_competition_and_user(competition_id, g.user['user_id'])
    (can_vote, message) = can_be_voted(competition)
    has_voted = my_votes and len(my_votes) >= MAX_TICKETS_PER_COMPETITION
    if can_vote:
        if has_voted:
            can_vote = False
            message = "You have voted!"
        elif g.user['role'] not in PERMITTED_VOTE_ROLES:
            can_vote = False
            message = "Your role are not permitted to vote!"
    return render_template('competitions/competition_vote.html', competition=competition, competitors=competitors, can_vote=can_vote, has_voted=has_voted, message=message, CURR_TIME=datetime.now())


@app.route('/vote', methods=['POST'])
@roles_required('voter')
def vote():
    """Cast a new vote"""
    competitor_id = request.json['competitor_id']

    if not competitor_id:
        abort(400, description='Competitor_id is required!')

    competitor = get_competitor_by_id(competitor_id)
    if not competitor:
        abort(404, description='Competitor not found!')

    competition = get_competition_by_id(competitor['competition_id'])
    if not competition:
        abort(404, description='Competition not found!')

    can_vote, message = can_be_voted(competition)
    if not can_vote:
        abort(400, description=message)

    if g.user['role'] not in PERMITTED_VOTE_ROLES:
        return jsonify({'success': False, 'message': 'Your role is not permitted to vote!'}), 200

    my_votes = get_votes_by_competition_and_user(competition['competition_id'], g.user['user_id'])
    if my_votes and len(my_votes) >= MAX_TICKETS_PER_COMPETITION:
        return jsonify({'success': False, 'message': 'You have voted, can not vote again!'}), 200

    vote = {
        'competitor_id': competitor_id,
        'voted_by': g.user['user_id'],
        'competition_id': competition['competition_id'],
        'voted_ip': request.remote_addr,
        'status': DEFAULT_VOTE_STATUS
    }

    vote_id = create_vote(vote)

    # flash('You have successfully voted!', 'danger')

    return jsonify({'success': True, 'vote_id': vote_id}), 200


def can_be_voted(competition):
    """If a competition can be voted and alert message depends on status and start and end date"""
    now = get_current_datetime()
    message = "This competition can not vote right now!"
    if not competition:
        return False, message
    if competition['start_date'] > now:
        return False, "This competition has not started!"
    if competition['status'] in ('finished', 'approved') or competition['end_date'] < now:
        return False, "This competition has finished!"
    return True, ""
