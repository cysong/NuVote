# ENGAGING WITH COMPETITIONS
from flask import render_template, g, request, jsonify, abort, redirect, url_for, flash
from yob import app


@app.route('/announcement/list')
def announcement_list():
    return render_template('announcements/announcement_list.html')


@app.route('/announcement/manage')
def announcement_manage():
    return render_template('announcements/announcement_mgmt.html')


@app.route('/announcement/edit/<int:announcement_id>')
def announcement_edit(announcement_id):
    return render_template('announcements/announcement_edit.html')


@app.route('/announcement/view/<int:announcement_id>')
def announcement_view(announcement_id):
    return render_template('announcements/announcement_view.html')
