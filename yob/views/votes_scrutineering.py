from flask import render_template, abort, jsonify

from yob import app
from yob.login_manage import roles_required
from yob.repositories.competition_repository import get_competition_by_id
from yob.repositories.competitors_repository import get_competitors_by_competition_id, get_competitors_with_votes_percentage
from yob.repositories.votes_repository import abandon_vote_by_id, abandon_votes_by_ids, abandon_votes_by_ip, get_daily_votes_by_competition, get_votes_by_filters, get_votes_group_by_ip_for_competition
from yob.utility import get_current_datetime
from flask import request
from datetime import timedelta


@app.route('/competition/<int:competition_id>/scrutineering')
@roles_required('admin', 'scrutineer')
def votes_scrutineering(competition_id):
    competition = get_competition_by_id(competition_id)
    if not competition:
        abort(404, f'Competition with id {competition_id} not found')
    votes = get_votes_group_by_ip_for_competition(competition_id)
    return render_template('votes/votes_scrutineering.html', competition=competition, votes=votes)

@app.route('/competition/<int:competition_id>/dailyvotes', methods=['GET'])
@roles_required('admin', 'scrutineer')
def daily_votes(competition_id):
    competition = get_competition_by_id(competition_id)
    if not competition:
        abort(404, f'Competition with id {competition_id} not found')

    daily_votes = get_daily_votes_by_competition(competition_id)

    # If there are votes, find the date range
    start_date = competition['start_date'].date()
    end_date = competition['end_date'].date()
    if daily_votes:
        start_date = min(daily_votes[0]['vote_date'], start_date)
        end_date = max(daily_votes[-1]['vote_date'], end_date)

    # Create a dictionary for all dates in the range with 0 votes initially
    date_range = {start_date + timedelta(days=x): {'valid_votes': 0, 'invalid_votes': 0} 
                  for x in range((end_date - start_date).days + 1)}

    # Update the dictionary with actual vote data
    for vote in daily_votes:
        date_range[vote['vote_date']] = {
            'valid_votes': vote['valid_votes'],
            'invalid_votes': vote['invalid_votes']
        }

    # Convert the dictionary back to a sorted list
    complete_daily_votes = [
        {'vote_date': date.strftime('%d/%m/%Y'), 'valid_votes': values['valid_votes'], 'invalid_votes': values['invalid_votes']}
        for date, values in sorted(date_range.items())
    ]

    response = {
        'success': True,
        'data': complete_daily_votes
    }
    return jsonify(response)


@app.route('/competition/<int:competition_id>/votes')
@roles_required('admin', 'scrutineer')
def votes_list(competition_id):
    competition = get_competition_by_id(competition_id)
    if not competition:
        abort(404, f'Competition with id {competition_id} not found')

    competitors = get_competitors_by_competition_id(competition_id)
    ip = request.args.get('ip')
    return render_template('votes/votes_list.html', competition=competition, competitors=competitors, ip=ip)

@app.route('/competition/<int:competition_id>/votes/query')
@roles_required('admin', 'scrutineer')
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
@roles_required('admin', 'scrutineer')
def abandon_vote(competition_id, vote_id):
    competition = get_competition_by_id(competition_id)
    if not competition or competition['status'] in ['in_plan', 'approved']:
        return jsonify(success=False, message="Cannot abandon votes for this competition."), 403

    updated_count = abandon_vote_by_id(vote_id)
    if updated_count:
        return jsonify(success=True, message="Vote disabled successfully.")
    return jsonify(success=False, message="Vote not found or already abandoned."), 404

@app.route('/competition/<int:competition_id>/votes/abandonbyids', methods=['POST'])
@roles_required('admin', 'scrutineer')
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
@roles_required('admin', 'scrutineer')
def abandon_vote_batch_by_ip(competition_id, ip):
    competition = get_competition_by_id(competition_id)
    if not competition or competition['status'] in ['in_plan', 'approved']:
        return jsonify(success=False, message="Cannot abandon votes for this competition."), 403

    updated_count = abandon_votes_by_ip(ip)
    if updated_count:
        return jsonify(success=True, message=f'You have successfully abandoned {updated_count} votes from IP {ip}')
    return jsonify(success=False, message="Votes not found or already abandoned."), 404