from functools import wraps

from flask import session, redirect, url_for, flash, render_template, request

from yob import app


# Helper functions to manage session data
def is_logged_in():
    '''Check if the user is logged in.'''
    return ('loggedin' in session and session['loggedin'] and
            'user_id' in session and 'username' in session and 'role' in session)


def get_role_from_session():
    '''Get the role of the user from the session.'''
    return session['role'] if 'role' in session else ''


def get_status_from_session():
    '''Get the status of the user from the session.'''
    return session['status'] if 'status' in session else ''


def get_user_id_from_session():
    '''Get the user ID from the session.'''
    return session['user_id'] if 'user_id' in session else ''


def get_username_id_from_session():
    '''Get the username from the session.'''
    return session['username'] if 'username' in session else ''


def get_profile_image_from_session():
    '''Get the profile image from the session.'''
    return session['profile_image'] if 'profile_image' in session else ''


# Context processor to inject user information into templates
@app.context_processor
def inject_user():
    '''Inject user information into templates.'''
    return dict(is_logged_in=is_logged_in(), role=get_role_from_session(), user_status=get_status_from_session(),
                user_id=get_user_id_from_session(), username=get_username_id_from_session(),
                profile_image=get_profile_image_from_session(), request=request)


def login_required(f):
    '''Decorator to check if the user is logged in.'''

    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not is_logged_in():
            flash("Access denied", "danger")
            return redirect(url_for('login'))
        return f(*args, **kwargs)

    return decorated_function


def owner_required(f):
    '''Decorator to check if the user is the owner of the resource.'''

    @wraps(f)
    def decorated_function(*args, **kwargs):
        user_id = kwargs.get('user_id')
        if user_id != session['user_id']:
            flash("Access denied", "danger")
            return render_template('error/error.html')
        return f(*args, **kwargs)

    return decorated_function
