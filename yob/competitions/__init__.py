from flask import Blueprint
import os


from yob.utility import import_all_modules_from_directory

bp = Blueprint('competitions', __name__)

import_all_modules_from_directory(os.path.dirname(__file__), __name__)
