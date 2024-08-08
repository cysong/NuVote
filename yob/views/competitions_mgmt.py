# COMPETITION SETUP
from flask import render_template

from yob import app
from yob.decorators import login_required, admin_required


@app.route('/competitions')
@login_required
@admin_required
def competitions_mgmt():
    # Render the admin home page with user information
    return render_template('competitions/competitions_mgmt.html')
