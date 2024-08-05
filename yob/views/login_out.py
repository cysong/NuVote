from flask import request, session, redirect, url_for, flash, render_template

from yob import app
from yob.repositories.users_repository import is_user_password_valid_by_username, get_user_by_username
from yob.utility import are_fields_present

LOGIN_REQUIRED_FIELDS = ['username', 'password']


# Route for login page (supports both GET and POST requests)
@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'loggedin' in session and session['loggedin']:
        return redirect(url_for('index'))

    if request.method == 'POST':
        username = ''
        if are_fields_present(request, LOGIN_REQUIRED_FIELDS):
            username = request.form['username']
            user_password = request.form['password']

            # Check if the user exist
            user = get_user_by_username(username)
            if user:
                # Check if the password is correct
                if is_user_password_valid_by_username(username, user_password):
                    login_user(user)
                    return redirect(url_for('index'))

        flash('Incorrect credential!', 'danger')
        return render_template('user/login.html', username=username)

    # Show the login form with message (if any)
    return render_template('user/login.html')


def login_user(user):
    session['loggedin'] = True
    session['user_id'] = user['user_id']
    session['username'] = user['username']
    session['role'] = user['role']
    session['status'] = user['status']
    session['profile_image'] = user['profile_image']


# Route for logout page
@app.route('/logout')
def logout():
    # Remove session data to log the user out
    session.pop('loggedin', None)
    session.pop('user_id', None)
    session.pop('username', None)
    session.pop('role', None)
    session.pop('status', None)
    session.pop('profile_image', None)
    return redirect(url_for('index'))
