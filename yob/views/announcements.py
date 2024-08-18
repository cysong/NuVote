# ENGAGING WITH COMPETITIONS
from flask import render_template, redirect, url_for, request, g, flash

from yob import app
from yob.config import DEFAULT_ANNOUNCEMENT_STATUS
from yob.decorators import login_required
from yob.login_manage import roles_required
from yob.repositories import announcements_repository
from yob.repositories.announcements_repository import Announcement, get_all_announcements
from yob.utility import are_fields_present


@app.route('/announcement/list')
def announcement_list():
    '''Render the announcements list page'''
    announcements = get_all_announcements()
    announcements.reverse()
    return render_template('announcements/announcement_list.html', announcements=announcements)


@app.route('/announcement/create', methods=['GET', 'POST'])
@login_required
@roles_required('admin', 'scrutineer')
def announcement_create():
    '''Render the announcement create page'''
    if request.method == 'POST':
        if are_fields_present(request, ['title', 'content', 'end_at']):
            announcement = Announcement(request.form['title'], request.form['content'], request.form['end_at'],
                                        DEFAULT_ANNOUNCEMENT_STATUS, g.user['user_id'])
            announcements_repository.create_announcement(announcement)
            flash("Announcement has crated successfully", "success")
        return redirect(url_for('announcements_mgmt'))
    return render_template('announcements/announcement_create.html')


@app.route('/announcement/edit/<int:announcement_id>')
@login_required
@roles_required('admin', 'scrutineer')
def announcement_edit(announcement_id):
    '''Render the announcement edit page'''
    return render_template('announcements/announcement_edit.html')


@app.route('/announcement/delete/<int:announcement_id>', methods=['POST'])
@login_required
@roles_required('admin', 'scrutineer')
def announcement_delete(announcement_id):
    '''Delete the announcement'''
    announcements_repository.delete_announcement(announcement_id)
    return redirect(url_for('announcements_mgmt'))


@app.route('/announcement/view/<int:announcement_id>')
def announcement_view(announcement_id):
    return render_template('announcements/announcement_view.html')
