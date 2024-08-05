from flask import request, flash, render_template, session

from yob import app
from yob.decorators import login_required
from yob.repositories.profile_repository import update_profile_by_user_id, UserProfile
from yob.repositories.users_repository import update_user_status, update_user_role, get_user_by_username, get_user_by_id, \
    get_user_by_email


@app.route('/profile/<int:user_id>', methods=['GET', 'POST'])
@login_required
def profile(user_id):
    # Check if the logged-in user is the profile owner or an admin
    if user_id == session['user_id'] or session['role'] == 'admin':
        if request.method == 'POST':
            if request.form.get('pmode') == 'edit':
                return render_profile_page(user_id, 'edit')
            if request.form.get('pmode') == 'submit':
                handle_profile_update(user_id)
                flash("Profile updated successfully", "success")
        return render_profile_page(user_id, 'view')
    # Access denied for non-owners and non-admins
    flash("Access denied", "danger")
    return render_template('error.html')


def handle_profile_update(user_id):
    if request.form.get('pmode') == 'submit':
        # Admin-specific profile updates
        if session['role'] == 'admin':
            role = request.form.get('role')
            status = request.form.get('status')
            # Ensure only the active admin can update status and role
            if session['status'] != 'active':
                flash("Access denied", "danger")
                return render_template('error.html')
            update_user_status(user_id, status)
            update_user_role(user_id, role)
            if len(request.form) == 3:
                return
            # Update role and status if the role and status have updated for current user
            if get_user_by_username(session['username'])['user_id'] == user_id:
                session['role'] = role
                session['status'] = status
        email = request.form.get('email')

        if get_user_by_email(email):
            flash('Email already exists!', 'danger')
            # Error handling

        # Regular user profile updates
        request.form.get('first_name')
        request.form.get('last_name')
        request.form.get('location')

        request.form.get('description')
        update_profile_by_user_id(user_id, UserProfile())


def render_profile_page(user_id, mode):
    # Fetch user details and render the profile page
    return render_template('user/profile.html', user=get_user_by_id(user_id), mode=mode)
