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
    # if competition not found, raise an error
    if not competition:
        abort(404, description=f"competition with id {competition_id} not found")
    competitors = get_competitors_and_votes(competition_id, g.user['user_id'] if g.user else 0)
    (can_vote, message) = can_be_voted(competition)
    if g.user:
        my_votes = get_votes_by_competition_and_user(competition_id, g.user['user_id'])
        has_voted = my_votes and len(my_votes) >= MAX_TICKETS_PER_COMPETITION
        if can_vote:
            # if user has voted, can not vote again
            if has_voted:
                can_vote = False
                message = "You have voted!"
            # if user's role is not permitted to vote, can not vote
            elif g.user['role'] not in PERMITTED_VOTE_ROLES:
                can_vote = False
                message = "Your role are not permitted to vote!"
    else:
        has_voted = False
    return render_template('competitions/competition_vote.html', competition=competition, competitors=competitors, can_vote=can_vote, has_voted=has_voted, message=message, CURR_TIME=datetime.now())


@app.route('/vote', methods=['POST'])
@roles_required('voter')
def vote():
    """Cast a new vote"""
    competitor_id = request.json['competitor_id']
    # if competitor_id is not present, raise an error
    if not competitor_id:
        abort(400, description='Competitor_id is required!')

    # if competitor not found, raise an error
    competitor = get_competitor_by_id(competitor_id)
    if not competitor:
        abort(404, description='Competitor not found!')

    # if competition not found, raise an error
    competition = get_competition_by_id(competitor['competition_id'])
    if not competition:
        abort(404, description='Competition not found!')

    can_vote, message = can_be_voted(competition)
    if not can_vote:
        abort(400, description=message)

    # if user's role is not permitted to vote, can not vote
    if g.user['role'] not in PERMITTED_VOTE_ROLES:
        return jsonify({'success': False, 'message': 'Your role is not permitted to vote!'}), 200
    
    # if user has voted, can not vote again
    my_votes = get_votes_by_competition_and_user(competition['competition_id'], g.user['user_id'])
    if my_votes and len(my_votes) >= MAX_TICKETS_PER_COMPETITION:
        return jsonify({'success': False, 'message': 'You have voted, can not vote again!'}), 200

    vote = {
        'competitor_id': competitor_id,
        'voted_by': g.user['user_id'],
        'competition_id': competition['competition_id'],
        'voted_ip': get_real_ip(),
        'status': DEFAULT_VOTE_STATUS
    }

    vote_id = create_vote(vote)

    # flash('You have successfully voted!', 'success')

    return jsonify({'success': True, 'vote_id': vote_id}), 200


def can_be_voted(competition):
    """If a competition can be voted and alert message depends on status and start and end date"""
    now = get_current_datetime()
    message = "This competition is not available yet."
    if not competition or competition['status'] in ('draft', 'in_plan'):
        return False, message
    if competition['start_date'] > now:
        return False, "This competition hasn't started yet!"
    if competition['status'] == 'approved':
        return False, "This competition is over, and the results have been published!"
    if competition['status'] == 'finished' or competition['end_date'] < now:
        return False, "This competition is over, and the final results will be announced soon!"
    return True, ""


def get_real_ip():
    """Get real ip, especially when server behiend a proxy"""
    # If X-Forwarded-For is not available, check the X-Real-IP header
    if request.headers.get('X-Real-IP'):
        ip = request.headers.get('X-Real-IP')
    # First, try to get the real IP address from the X-Forwarded-For header
    elif request.headers.getlist("X-Forwarded-For"):
        ip = request.headers.getlist("X-Forwarded-For")[0]
    # As a last resort, use the remote address directly from the request
    else:
        ip = request.remote_addr
    return ip