from flask import render_template, g, request, jsonify, abort, redirect, url_for, flash
from yob import app


@app.route('/competition/<int:competition_id>/competitors')
def competitor_manage(competition_id):
    return render_template('competitors/competitor_mgmt.html')


@app.route('/competitor/edit/<int:competitor_id>')
def competitor_edit(competitor_id):
    return render_template('competitors/competitor_edit.html')


@app.route('/competitor/view/<int:competitor_id>')
def competitor_view(competitor_id):
    return render_template('competitors/competitor_view.html')
