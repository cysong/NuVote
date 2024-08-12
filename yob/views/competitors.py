from flask import render_template, g, request, jsonify, abort, redirect, url_for, flash
from yob import app

from yob.repositories.competitors_repository import get_competitor_by_id


@app.route('/competition/<int:competition_id>/competitors')
def competitors_manage(competition_id):
    return render_template('competitors/competitors_mgmt.html')


@app.route('/competitor/edit/<int:competitor_id>')
def competitor_edit(competitor_id):
    return render_template('competitors/competitor_edit.html')


@app.route('/competitor/view/<int:competitor_id>')
def competitor_view(competitor_id):
    competitor = get_competitor_by_id(competitor_id)
    if not competitor:
        abort(404, description=f"Competitor with id {competitor_id} not found!")
    return render_template('competitors/competitor_view.html', competitor=competitor)
