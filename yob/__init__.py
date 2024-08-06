from flask import Flask, g
from flask_hashing import Hashing
import os

import yob.config as config
from yob.config import DEFAULT_PROFILE_IMAGES_FOLDER,DEFAULT_COMPETITOR_IMAGES_FOLDER,DEFAULT_COMPETITION_IMAGES_FOLDER
from yob.login_manage import LoginManager
from .database import Cursor

app = Flask(__name__, static_folder='static', template_folder='templates')

# create an instance of hashing
app.hashing = Hashing(app)

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = config.DEFAULT_SECRET_KEY

from . import  decorators, views

# Create image upload directories and save to app
def init_upload_folder(key, value):
    folder = os.path.join(app.root_path, value)
    if not os.path.exists(folder):
        os.makedirs(folder)
    app.config[key] = folder

init_upload_folder('PROFILE_IMAGES_ABS_PATH', DEFAULT_PROFILE_IMAGES_FOLDER)
init_upload_folder('COMPETITOR_IMAGES_ABS_PATH',DEFAULT_COMPETITOR_IMAGES_FOLDER)
init_upload_folder('COMPETITION_IMAGES_ABS_PATH',DEFAULT_COMPETITION_IMAGES_FOLDER)

# initial of LoginManager
login_manager = LoginManager(app, login_view='login')

@login_manager.user_loader
def load_user(user_id):
    """user loader for login manager"""
    with Cursor(dictionary=True) as cursor:
        cursor.execute(
            'SELECT user_id, username, first_name, last_name, location,email,description, profile_image, '
            'role, status, created_at FROM users WHERE user_id = %s',
            (user_id,))
        user = cursor.fetchone()
    return user


@app.context_processor
def inject_user():
    """inject global template variables"""
    current_user = g.user if 'user' in g else {}
    return dict(APP_NAME=config.APP_NAME, SLOGAN=config.SLOGAN, CURRENT_USER=current_user, DEFAULT_PROFILE_IMAGE=config.DEFAULT_PROFILE_IMAGE)

