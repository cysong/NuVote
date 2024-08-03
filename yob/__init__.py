from flask import Flask
from flask_hashing import Hashing

from yob.config import DEFAULT_PASSWORD_SALT, DEFAULT_SECRET_KEY

app = Flask(__name__, static_folder='static', template_folder='templates')

hashing = Hashing(app)  # create an instance of hashing

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = DEFAULT_SECRET_KEY

PASSWORD_SALT = DEFAULT_PASSWORD_SALT

from yob import index
from yob import users_mgmt
from yob import login_out
from yob import decorators
from yob import error
from yob import update_password
from yob import profile
from yob import profile_image
from yob import register
