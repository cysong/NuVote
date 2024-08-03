# Default role assigned to new users upon registration.
DEFAULT_SECRET_KEY = 'Example Secret Key (Change this!)'
# IMPORTANT: Change 'ExampleSaltValue' to whatever salt value you'll use in
DEFAULT_PASSWORD_SALT = 'ExampleSaltValue'
DEFAULT_USER_DESCRIPTION = ''
DEFAULT_USER_ROLE = 'voter'
DEFAULT_USER_STATUS = 'active'
DEFAULT_PROFILE_IMAGES_FOLDER = 'static/profile_images'
DEFAULT_PROFILE_IMAGE = 'default_profile.jpg'
DEFAULT_PROFILE_IMAGE_PATH = f"/{DEFAULT_PROFILE_IMAGES_FOLDER}/{DEFAULT_PROFILE_IMAGE}"
DEFAULT_COMPETITOR_IMAGES_FOLDER = 'static/competitor_images'
DEFAULT_COMPETITION_IMAGES_FOLDER = 'static/competition_images'
DEFAULT_MIN_BIRTHDATE = '1900-01-01'
DEFAULT_PASSWORD_REGEX = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'
