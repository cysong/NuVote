# Define app name
from unittest.mock import DEFAULT


APP_NAME = 'Wildlife of the Year'
SLOGAN = 'Vote for the Heart of Aotearoa’s Wilderness!'
# Default role assigned to new users upon registration.
DEFAULT_SECRET_KEY = '16ef49d7e56c50b0de84898da482e8a2'
# IMPORTANT: Change 'ExampleSaltValue' to whatever salt value you'll use in
DEFAULT_PASSWORD_SALT = '16ef49d7e56c50b0de84898da482e8a2'
DEFAULT_USER_DESCRIPTION = ''
DEFAULT_USER_ROLE = 'voter'
DEFAULT_USER_STATUS = 'active'
DEFAULT_PROFILE_IMAGES_FOLDER = 'static/uploads/profile_images'
DEFAULT_COMPETITOR_IMAGES_FOLDER = 'static/uploads/competitor_images'
DEFAULT_COMPETITION_IMAGES_FOLDER = 'static/uploads/competition_images'
DEFAULT_PROFILE_IMAGE = '/static/images/default_profile.png'
DEFAULT_COMPETITION_IMAGE = '/static/images/default_competition.png'
DEFAULT_COMPETITOR_IMAGE = '/static/images/default_competitor.png'
DEFAULT_MIN_BIRTHDATE = '1900-01-01'
USERNAME_REGX = r'^[a-zA-Z0-9_-]{3,50}$'
DEFAULT_PASSWORD_REGEX = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'
EMAIL_REGEX = r'^([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+$'
ALLOWED_EXTENSIONS = ('png', 'jpg', 'jpeg', 'gif', '.webp', '.bmp')

DEFAULT_VOTE_STATUS = 'valid'
DEFAULT_COMPETITION_STATUS = 'draft'
DEFAULT_ANNOUNCEMENT_STATUS = 'active'
PERMITTED_VOTE_ROLES = ['voter']
MAX_TICKETS_PER_COMPETITION = 1
# Maximum number of latest voted users to display on the home page
MAX_LATEST_VOTE_USERS = 15
# Maximum number of latest competitions to display on the home page
MAX_LATEST_COMPETITIONS = 10

DEFAULT_DATE_FORMAT = '%d/%m/%Y'
DEFAULT_DATETIME_FORMAT = '%d/%m/%Y %I:%M:%S %p'
