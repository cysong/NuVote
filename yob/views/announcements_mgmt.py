# ANNOUNCEMENTS
from flask import render_template

from yob import app
from yob.decorators import login_required, admin_required


@app.route('/announcements')
@login_required
@admin_required
def announcements_mgmt():
    # Render the admin home page with user information
    return render_template('announcements/announcements_mgmt.html')
