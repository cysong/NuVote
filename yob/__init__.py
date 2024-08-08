import os
from datetime import timedelta

from flask import Flask, g

import yob.config as config
from yob.config import DEFAULT_PROFILE_IMAGES_FOLDER, DEFAULT_COMPETITOR_IMAGES_FOLDER, \
    DEFAULT_COMPETITION_IMAGES_FOLDER
from yob.login_manage import LoginManager
from .repositories.users_repository import get_user_by_id

app = Flask(__name__, static_folder='static', template_folder='templates')

# create an instance of hashing
# app.hashing = Hashing(app)

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = config.DEFAULT_SECRET_KEY

from . import decorators, views


# Create image upload directories and save to app

def init_upload_folder(key, value):
    folder = os.path.join(app.root_path, value)
    if not os.path.exists(folder):
        os.makedirs(folder)
    app.config[key] = folder


init_upload_folder('PROFILE_IMAGES_ABS_PATH', DEFAULT_PROFILE_IMAGES_FOLDER)
init_upload_folder('COMPETITOR_IMAGES_ABS_PATH', DEFAULT_COMPETITOR_IMAGES_FOLDER)
init_upload_folder('COMPETITION_IMAGES_ABS_PATH', DEFAULT_COMPETITION_IMAGES_FOLDER)

# initial of LoginManager
login_manager = LoginManager(app, login_view='login')


@login_manager.user_loader
def load_user(user_id):
    return get_user_by_id(user_id)


@app.context_processor
def inject_user():
    """inject global template variables"""
    current_user = g.user if 'user' in g else {}
    return dict(APP_NAME=config.APP_NAME, SLOGAN=config.SLOGAN, CURRENT_USER=current_user,
                DEFAULT_PROFILE_IMAGE=config.DEFAULT_PROFILE_IMAGE)


@app.template_filter('format_relative_time')
def format_relative_time(time_diff):
    """Custom Jinja filter, format timedelta to human-readable style"""
    if isinstance(time_diff, timedelta):
        intervals = [
            ('year', timedelta(days=365)),
            ('month', timedelta(days=30)),
            ('week', timedelta(weeks=1)),
            ('day', timedelta(days=1)),
            ('hour', timedelta(hours=1)),
            ('minute', timedelta(minutes=1)),
            ('second', timedelta(seconds=1))
        ]

        for label, interval in intervals:
            count = int(time_diff / interval)
            if count >= 1:
                # Return a formatted string with the appropriate time label
                return f"{count} {label}{'s' if count > 1 else ''}"

        return 'now'
    else:
        raise TypeError("Expected timedelta type for time_diff")
