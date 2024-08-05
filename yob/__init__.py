from flask import Flask
from flask_hashing import Hashing
import os

from yob.config import DEFAULT_PASSWORD_SALT, DEFAULT_SECRET_KEY,DEFAULT_PROFILE_IMAGES_FOLDER,DEFAULT_COMPETITOR_IMAGES_FOLDER,DEFAULT_COMPETITION_IMAGES_FOLDER

app = Flask(__name__, static_folder='static', template_folder='templates')

hashing = Hashing(app)  # create an instance of hashing

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = DEFAULT_SECRET_KEY

PASSWORD_SALT = DEFAULT_PASSWORD_SALT

APP_ROOT_DIR = os.path.dirname(__file__)

from yob import decorators
import yob.views

# Create image upload directories and save to app
def init_upload_folder(key, value):
    folder = os.path.join(APP_ROOT_DIR, value)
    if not os.path.exists(folder):
        os.makedirs(folder)
    app.config[key] = folder

init_upload_folder('DEFAULT_PROFILE_IMAGES_FOLDER', DEFAULT_PROFILE_IMAGES_FOLDER)
init_upload_folder('DEFAULT_COMPETITOR_IMAGES_FOLDER',DEFAULT_COMPETITOR_IMAGES_FOLDER)
init_upload_folder('DEFAULT_COMPETITION_IMAGES_FOLDER',DEFAULT_COMPETITION_IMAGES_FOLDER)