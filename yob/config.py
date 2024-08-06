# Define app name
APP_NAME = 'Nu Voting System'
SLOGAN = 'Your vote is your voice'
# Default role assigned to new users upon registration.
DEFAULT_SECRET_KEY = '16ef49d7e56c50b0de84898da482e8a2'
# IMPORTANT: Change 'ExampleSaltValue' to whatever salt value you'll use in
DEFAULT_PASSWORD_SALT = '16ef49d7e56c50b0de84898da482e8a2'
DEFAULT_USER_DESCRIPTION = ''
DEFAULT_USER_ROLE = 'voter'
DEFAULT_USER_STATUS = 'active'
DEFAULT_PROFILE_IMAGES_FOLDER = 'static/uploads/profile_images'
DEFAULT_PROFILE_IMAGE = '/static/images/default_profile.png'
DEFAULT_COMPETITOR_IMAGES_FOLDER = 'static/uploads/competitor_images'
DEFAULT_COMPETITION_IMAGES_FOLDER = 'static/uploads/competition_images'
DEFAULT_MIN_BIRTHDATE = '1900-01-01'
USERNAME_REGX = r'^[a-zA-Z0-9_-]{3,50}$'
DEFAULT_PASSWORD_REGEX = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'
EMAIL_REGEX = r'^([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+$'
ALLOWED_EXTENSIONS = ('png', 'jpg', 'jpeg', 'gif', '.webp', '.bmp')