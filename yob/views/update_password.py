import re

from flask import redirect, request, flash, render_template, session, url_for

from yob import app
from yob.config import DEFAULT_PASSWORD_REGEX
from yob.decorators import login_required, owner_required
from yob.repositories.users_repository import update_user_password_by_id, is_user_password_valid_by_id, get_user_by_id


@app.route('/profile/<int:user_id>/password', methods=['GET', 'POST'])
@login_required
@owner_required
def password(user_id):
    '''Handle password update'''
    if request.method == 'POST':
        old_password = request.form.get('old_password')
        new_password = request.form.get('new_password')
        confirm_new_password = request.form.get('confirm_new_password')
        # Validate passwords
        if new_password != confirm_new_password:
            flash("Passwords do not match", "danger")
            return redirect(url_for('password', user_id=user_id))
        if old_password == new_password:
            flash("New Password cannot be same as the old password", "danger")
            return redirect(url_for('password', user_id=user_id))
        if not re.match(DEFAULT_PASSWORD_REGEX, new_password):
            flash('Password must be at least 8 characters long and include a mix of letters, numbers, '
                  'and special characters (@$!%*?&)!', 'danger')
            return redirect(url_for('password', user_id=user_id))
        if not is_user_password_valid_by_id(user_id, old_password):
            flash('Password is incorrect!', 'danger')
            return redirect(url_for('password', user_id=user_id))
        # Update password if old password is valid
        else:
            update_user_password_by_id(user_id, new_password)
            flash("Password updated successfully", "success")
            return redirect(url_for('profile', user_id=user_id))
    # Render the password change page
    return render_template('user/password.html', user=get_user_by_id(user_id),
                           username=session['username'], mode='view')
