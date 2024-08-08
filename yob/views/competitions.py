# ENGAGING WITH COMPETITIONS
from flask import render_template, g, request, jsonify, abort, redirect, url_for, flash
from yob import app


@app.route('/competition/manage')
def competition_manage():
    return render_template('competitions/competion_mgmt.html')


@app.route('/competition/edit/<int:competition_id>')
def competition_edit(competition_id):
    return render_template('competitions/competion_edit.html')


@app.route('/competition/view/<int:competition_id>')
def competition_view(competition_id):
    return render_template('competitions/competition_view.html')
