from functools import wraps

from flask import session, redirect, url_for, flash, render_template, request

from yob import app
from yob.config import DEFAULT_USER_ROLE


# Helper functions to manage session data
def is_logged_in():
    return 'loggedin' in session and 'id' in session and 'username' in session and 'role' in session


def get_role_from_session():
    return session['role'] if 'role' in session else DEFAULT_USER_ROLE


def get_status_from_session():
    return session['status'] if 'status' in session else 'inactive'


def get_user_id_from_session():
    return session['id'] if 'id' in session else 0


def get_username_id_from_session():
    return session['username'] if 'username' in session else ''


# Context processor to inject user information into templates
@app.context_processor
def inject_user():
    return dict(is_logged_in=is_logged_in(), role=get_role_from_session(), user_status=get_status_from_session(),
                user_id=get_user_id_from_session(), username=get_username_id_from_session(), request=request)


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'loggedin' not in session:
            flash("Access denied", "danger")
            return redirect(url_for('login'))
        return f(*args, **kwargs)

    return decorated_function


def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'role' not in session or session['role'] != 'admin':
            flash("Access denied", "danger")
            return render_template('error.html')
        return f(*args, **kwargs)

    return decorated_function


def owner_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        user_id = kwargs.get('user_id')
        if user_id != session['id']:
            flash("Access denied", "danger")
            return render_template('error.html')
        return f(*args, **kwargs)

    return decorated_function


def inactive_user_message(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'status' in session and session['status'] == 'inactive':
            flash("You are currently inactive and cannot post or reply. Please contact the "
                  "administrator for assistance!", "warning")
        return f(*args, **kwargs)

    return decorated_function


def inactive_user_action_check(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if request.method == 'POST' and 'status' in session and session['status'] == 'inactive':
            flash("You are currently inactive and cannot post, reply and delete. Please contact the "
                  "administrator for assistance!", "warning")
            return render_template('error.html')  # Render an error page or redirect as needed
        return f(*args, **kwargs)

    return decorated_function
