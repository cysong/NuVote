# ANNOUNCEMENTS
from flask import render_template

from yob import app
from yob.decorators import login_required, admin_required
from yob.repositories.announcements_repository import get_all_announcements


@app.route('/announcements')
@login_required
@admin_required
def announcements_mgmt():
    # Render the admin home page with user information
    announcements = get_all_announcements()
    announcements.reverse()
    return render_template('announcements/announcements_mgmt.html', announcements=announcements)
