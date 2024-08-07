from flask import render_template, g, request, jsonify, abort
from yob import app
from yob.repositories.competition_repository import get_competition_by_id
from yob.repositories.competitors_repository import get_competitors_and_votes, get_competitor_by_id
from yob.repositories.votes_repository import get_votes_by_competition_and_user, create_vote
from yob.login_manage import login_required, roles_required

from datetime import datetime


@app.route('/competition/vote/<int:competition_id>', methods=['GET'])
@login_required
def competition_vote(competition_id):
    competition = get_competition_by_id(competition_id)
    if not competition:
        raise ValueError(f"competition with id {competition_id} not found")
    competitors = get_competitors_and_votes(competition_id, g.user['user_id'])
    votes_by_me = get_votes_by_competition_and_user(competition_id, g.user['user_id'])
    (can_vote, message) = can_be_voted(competition)
    has_voted = votes_by_me and len(votes_by_me)>0
    if can_vote:
        if has_voted:
            can_vote = False
            message = "You have voted!"
        elif g.user['role'] != 'voter':
            can_vote = False
            message = "Your account are not permited to vote!"
    return render_template('competitions/vote.html', competition=competition, competitors=competitors, can_vote=can_vote, has_voted=has_voted, message=message, CURR_TIME=datetime.now())


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

    if g.user['role'] != 'voter':
        abort(403, description='Your account is not permitted to vote!')

    vote = {
        'competitor_id': competitor_id,
        'voted_by': g.user['user_id'],
        'competition_id': competition['competition_id'],
        'voted_ip': request.remote_addr,
        'status': 'valid'
    }

    vote_id = create_vote(vote)

    return jsonify({'success': True, 'vote_id': vote_id}), 200

def can_be_voted(competition):
    now = datetime.now()
    message = "This competition can not vote right now!"
    if not competition:
        return False, message
    if competition['start_date']>now:
        return False, "This competition has not started!"
    if competition['status'] in ('finished','approved') or competition['end_date']<now:
        return False, "This competition has finished!"
    return True, ""