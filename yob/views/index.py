from flask import render_template

from yob import app
from yob.repositories.announcements_repository import get_latest_active_announcement
from yob.repositories.competition_repository import get_recent_competitions
from yob.utility import get_current_datetime


# Route for home page (supports both GET request)
@app.route('/')
def index():
    # Show the index/home page
    latest_announcement = get_latest_active_announcement()
    competitions = get_recent_competitions()
    now = get_current_datetime()
    return render_template('index.html',
                           announcement=latest_announcement, competitions=competitions, CURR_TIME=now)


@app.route('/competition/list')
def competition_list():
    pass


@app.route('/competition/<int:competition_id>')
def competition_detail(competition_id):
    pass


@app.route('/competitor/<int:competitor_id>')
def competitor_details(competitor_id):
    pass


@app.route('/announcement/list')
def announcement_list():
    pass


@app.route('/announcement/<int:announcement_id>')
def announcement_detail(announcement_id):
    pass
