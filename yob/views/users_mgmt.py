# MANAGING USERS
import re

from flask import render_template, request, flash, redirect, url_for

from yob import app, config
from yob.decorators import login_required
from yob.login_manage import roles_required
from yob.repositories.users_repository import get_users, get_user_by_username, get_user_by_email, User, create_user
from yob.utility import are_fields_present

CREATE_USER_REQUIRED_FIELDS = ['username', 'email', 'password', 'password2', 'first_name', 'last_name', 'location']


@app.route('/users')
@login_required
@roles_required('admin', 'scrutineer')
def users_mgmt():
    '''Render the admin home page with user information'''
    return render_template('user/users_mgmt.html', users=get_users())


@app.route('/users/create', methods=['GET', 'POST'])
@login_required
@roles_required('admin')
def user_create():
    '''Create a new scrutineer account or admin account'''
    if request.method == 'POST':
        form_data = request.form.to_dict()

        if are_fields_present(request, CREATE_USER_REQUIRED_FIELDS):

            username = request.form['username']
            email = request.form['email']
            password = request.form['password']

            # Validation checks
            if not re.match(config.EMAIL_REGEX, email):
                flash('Invalid email address!', 'danger')
                form_data.pop('email', None)
                return render_user_create(form_data)

            if not re.match(config.USERNAME_REGX, username):
                flash('Username must contain only characters and numbers!', 'danger')
                form_data.pop('username', None)
                return render_user_create(form_data)

            if not re.match(config.DEFAULT_PASSWORD_REGEX, password):
                flash('Password must be at least 8 characters long and include a mix of letters, numbers, '
                      'and special characters (@$!%*?&)!', 'danger')
                form_data.pop('password', None)
                form_data.pop('password2', None)
                return render_user_create(form_data)

            if password != request.form['password2']:
                flash('Password does not match', 'danger')
                form_data.pop('password', None)
                form_data.pop('password2', None)
                return render_user_create(form_data)

            if get_user_by_username(username):
                flash('Account already exists!', 'danger')
                form_data.pop('username', None)
                return render_user_create(form_data)

            if get_user_by_email(email):
                flash('Email already exists!', 'danger')
                form_data.pop('email', None)
                return render_user_create(form_data)

            # all form data are valid
            user = User(username, request.form['first_name'], request.form['last_name'],
                        request.form['location'], email, config.DEFAULT_USER_DESCRIPTION, password,
                        request.form['role'])
            create_user(user)
            flash(f'{username} have successfully created!', 'success')
            return redirect(url_for('users_mgmt'))
        else:
            # Form is empty (no POST data)
            flash('Please fill out the form!', 'danger')
            return render_user_create(form_data)
    return render_user_create(None)


def render_user_create(form_data):
    '''Render the user create page with the submitted form data'''
    submitted_form = {}
    if form_data is not None:
        submitted_form = {field: form_data[field] if field in form_data and form_data[field] else '' for field in
                          CREATE_USER_REQUIRED_FIELDS}
    return render_template('user/user_create.html', form_data=submitted_form)
