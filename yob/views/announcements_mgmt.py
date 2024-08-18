# ANNOUNCEMENTS
from flask import render_template

from yob import app
from yob.decorators import login_required
from yob.login_manage import roles_required
from yob.repositories.announcements_repository import get_all_announcements


# Render the admin home page with user information
@app.route('/announcements')
@login_required
@roles_required('admin', 'scrutineer')
def announcements_mgmt():
    '''Render the announcements management page'''
    announcements = get_all_announcements()
    announcements.reverse()
    return render_template('announcements/announcements_mgmt.html', announcements=announcements)
