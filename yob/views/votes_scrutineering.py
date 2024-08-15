from flask import render_template, abort, jsonify

from yob import app
from yob.repositories.competition_repository import get_competition_by_id
from yob.repositories.competitors_repository import get_competitors_by_competition_id, get_competitors_with_votes_percentage
from yob.repositories.votes_repository import abandon_vote_by_id, abandon_votes_by_ids, abandon_votes_by_ip, get_votes_by_filters, get_votes_group_by_ip_for_competition
from yob.utility import get_current_datetime
from flask import request


@app.route('/competition/<int:competition_id>/scrutineering')
def votes_scrutineering(competition_id):
    competition = get_competition_by_id(competition_id)
    if not competition:
        abort(404, f'Competition with id {competition_id} not found')
    votes = get_votes_group_by_ip_for_competition(competition_id)
    return render_template('votes/votes_scrutineering.html', competition=competition, votes=votes)


@app.route('/competition/<int:competition_id>/votes')
def votes_list(competition_id):
    competition = get_competition_by_id(competition_id)
    if not competition:
        abort(404, f'Competition with id {competition_id} not found')

    competitors = get_competitors_by_competition_id(competition_id)
    ip = request.args.get('ip')
    return render_template('votes/votes_list.html', competition=competition, competitors=competitors, ip=ip)

@app.route('/competition/<int:competition_id>/votes/query')
def votes_query(competition_id):
    competition = get_competition_by_id(competition_id)
    if not competition:
        return jsonify(success=False, message="Competition not found"), 404

    ip = request.args.get('ip')
    status = request.args.get('status', 'valid')
    competitor_id = request.args.get('competitor_id')

    votes = get_votes_by_filters(competition_id, ip, status, competitor_id)
    return jsonify(success=True, votes=votes)

@app.route('/competition/<int:competition_id>/votes/abandon/<int:vote_id>')
def abandon_vote(competition_id, vote_id):
    competition = get_competition_by_id(competition_id)
    if not competition or competition['status'] in ['in_plan', 'approved']:
        return jsonify(success=False, message="Cannot abandon votes for this competition."), 403

    updated_count = abandon_vote_by_id(vote_id)
    if updated_count:
        return jsonify(success=True, message="Vote disabled successfully.")
    return jsonify(success=False, message="Vote not found or already abandoned."), 404

@app.route('/competition/<int:competition_id>/votes/abandonbyids', methods=['POST'])
def abandon_vote_batch(competition_id):
    vote_ids = request.form.getlist('vote_ids')
    vote_ids = request.get_json().get('vote_ids', [])
    if not vote_ids or len(vote_ids) == 0:
        return jsonify(success=False, message="Please select at least one vote to abandon."), 400
    competition = get_competition_by_id(competition_id)
    if not competition or competition['status'] in ['in_plan', 'approved']:
        return jsonify(success=False, message="Cannot abandon votes for this competition."), 403

    updated_count = abandon_votes_by_ids(vote_ids)
    if updated_count:
        return jsonify(success=True, message=f'You have successfully abandoned {updated_count} votes')
    return jsonify(success=False, message="Votes not found or already abandoned."), 404

@app.route('/competition/<int:competition_id>/votes/abandonbyip/<string:ip>')
def abandon_vote_batch_by_ip(competition_id, ip):
    competition = get_competition_by_id(competition_id)
    if not competition or competition['status'] in ['in_plan', 'approved']:
        return jsonify(success=False, message="Cannot abandon votes for this competition."), 403

    updated_count = abandon_votes_by_ip(ip)
    if updated_count:
        return jsonify(success=True, message=f'You have successfully abandoned {updated_count} votes from IP {ip}')
    return jsonify(success=False, message="Votes not found or already abandoned."), 404
