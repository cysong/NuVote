import re

from flask import request, session, redirect, url_for, flash, render_template, jsonify

from yob import app
from yob.config import DEFAULT_PASSWORD_REGEX, DEFAULT_USER_DESCRIPTION
from yob.views.login_out import login_user
from yob.repositories.users_repository import User, get_user_by_username, get_user_by_email, create_user, check_username_exists, check_email_exists
from yob.utility import are_fields_present

REGISTER_REQUIRED_FIELDS = ['username', 'email', 'password', 'password2', 'first_name', 'last_name', 'location']


# Route for registration page (supports both GET and POST requests)
@app.route('/register', methods=['GET', 'POST'])
def register():
    if 'loggedin' in session and session['loggedin']:
        return redirect(url_for('index'))

    if request.method == 'POST':
        form_data = request.form.to_dict()

        if are_fields_present(request, REGISTER_REQUIRED_FIELDS):
            username = request.form['username']
            email = request.form['email']
            password = request.form['password']

            # Validation checks
            if not re.match(r'[^@]+@[^@]+\.[^@]+', email):
                flash('Invalid email address!', 'danger')
                form_data.pop('email', None)
                return render_register(form_data)

            if not re.match(r'[A-Za-z0-9]+', username):
                flash('Username must contain only characters and numbers!', 'danger')
                form_data.pop('username', None)
                return render_register(form_data)

            if not re.match(DEFAULT_PASSWORD_REGEX, password):
                flash('Password must be at least 8 characters long and include a mix of letters, numbers, '
                      'and special characters (@$!%*?&)!', 'danger')
                form_data.pop('password', None)
                form_data.pop('password2', None)
                return render_register(form_data)

            if password != request.form['password2']:
                flash('Password does not match', 'danger')
                form_data.pop('password', None)
                form_data.pop('password2', None)
                return render_register(form_data)

            if get_user_by_username(username):
                flash('Account already exists!', 'danger')
                form_data.pop('username', None)
                return render_register(form_data)

            if get_user_by_email(email):
                flash('Email already exists!', 'danger')
                form_data.pop('email', None)
                return render_register(form_data)

            # all form data are valid
            user = User(username, request.form['first_name'], request.form['last_name'],
                        request.form['location'], email, DEFAULT_USER_DESCRIPTION, password)
            db_user = create_user(user)
            flash('You have successfully registered!', 'success')
            login_user(db_user)
            return redirect(url_for('index'))
        else:
            # Form is empty (no POST data)
            flash('Please fill out the form!', 'danger')
            return render_register(form_data)

    # Show registration form
    return render_register(None)

@app.route('/user/check_username', methods=['POST'])
def check_username():
    """Check if username has been taken"""
    username = request.json['username']
    # Check if the username exists in the database
    is_taken = check_username_exists(username)
    return jsonify({'taken': is_taken})

@app.route('/user/check_email', methods=['POST'])
def check_email():
    """Check if username has been taken"""
    email = request.json['email']
    # Check if the username exists in the database
    is_taken = check_email_exists(email)
    return jsonify({'taken': is_taken})

def render_register(form_data):
    submitted_form = {}
    if form_data is not None:
        submitted_form = {field: form_data[field] if field in form_data and form_data[field] else '' for field in
                          REGISTER_REQUIRED_FIELDS}
    return render_template('user/register.html', form_data=submitted_form)
