# MANAGING USERS
from flask import render_template

from yob import app
from yob.decorators import login_required, admin_required
from yob.repositories.users_repository import get_users


@app.route('/users')
@login_required
@admin_required
def users_mgmt():
    # Render the admin home page with user information
    return render_template('user/users_mgmt.html', users=get_users())