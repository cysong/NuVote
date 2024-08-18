from flask import render_template

from yob import app
from yob.repositories.announcements_repository import get_latest_active_announcement
from yob.repositories.competition_repository import get_latest_competitions
from yob.repositories.users_repository import get_latest_voted_users
from yob.utility import get_current_datetime


# Route for home page (supports both GET request)
@app.route('/')
def index():
    '''Show the index/home page'''
    latest_announcement = get_latest_active_announcement()
    competitions = get_latest_competitions()
    refined = [c for c in competitions if c['status'] != 'draft']
    now = get_current_datetime()
    latest_voted_users = get_latest_voted_users()
    return render_template('index.html',
                           announcement=latest_announcement, competitions=refined, CURR_TIME=now,
                           users=latest_voted_users)
