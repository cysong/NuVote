from yob import hashing, PASSWORD_SALT
from yob.config import DEFAULT_PROFILE_IMAGES_FOLDER, DEFAULT_USER_ROLE, DEFAULT_USER_STATUS, \
    DEFAULT_PROFILE_IMAGE_PATH
from yob.utility import get_current_datetime
from yob.database import get_cursor

class User:
    def __init__(self, username, first_name, last_name, location, email, description, password):
        self.username = username
        self.first_name = first_name
        self.last_name = last_name
        self.location = location
        self.email = email
        self.description = description
        self.password = password


def get_users():
    cursor = get_cursor()
    cursor.execute(
        '''SELECT u.user_id, u.username, u.email, u.first_name AS firstname, u.last_name AS last_name, 
                  u.description, u.location, u.profile_image, 
                  u.role, u.status 
           FROM users u 
           ORDER BY u.user_id'''
    )
    users = cursor.fetchall()
    return users


def get_user_by_id(user_id):
    # We need all the user info for the user, so we can display it on the profile page
    cursor = get_cursor()
    cursor.execute(
        'SELECT user_id, username, first_name, last_name, location,email,description, profile_image, '
        'role, status, created_at FROM users WHERE user_id = %s',
        (user_id,))
    user = cursor.fetchone()
    # Set default Profile Image
    return user


def get_user_by_username(username):
    # We need all the account info for the user, so we can display it on the profile page
    cursor = get_cursor()
    cursor.execute(
        'SELECT user_id, username, first_name, last_name, location,email,description, profile_image, role, status, created_at FROM users WHERE username = %s',
        (username,))
    user = cursor.fetchone()
    # Set default Profile Image
    return user


def get_password_by_username(username):
    # We need all the account info for the user, so we can display it on the profile page
    cursor = get_cursor()
    cursor.execute(
        'SELECT password_hash FROM users WHERE username = %s',
        (username,))
    user = cursor.fetchone()
    # Set default Profile Image
    return user


def get_user_by_email(email):
    # We need all the account info for the user, so we can display it on the profile page
    cursor = get_cursor()
    cursor.execute(
        'SELECT user_id, username, first_name, last_name, location,email,description, profile_image, '
        'role, status, created_at FROM users WHERE email = %s',
        (email,))
    user = cursor.fetchone()
    # Set default Profile Image
    return user


def handle_default_profile(user):
    if user is None:
        return None
    # Set default Profile Image
    if user['profile_image'] == '':
        user['profile_image'] = DEFAULT_PROFILE_IMAGE_PATH
    else:
        user['profile_image'] = f"/{DEFAULT_PROFILE_IMAGES_FOLDER}/{user['profile_image']}"
    return user


def create_user(user: User):
    cursor = get_cursor()
    cursor.execute(
        'INSERT INTO users ('
        'username, '
        'first_name, '
        'last_name, '
        'location, '
        'email, '
        'description, '
        'profile_image,'
        'password_hash, '
        'role, '
        'status,'
        'created_at) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
        (
            user.username,
            user.first_name,
            user.last_name,
            user.location,
            user.email,
            user.description,
            DEFAULT_PROFILE_IMAGE_PATH,
            hashing.hash_value(user.password, PASSWORD_SALT),
            DEFAULT_USER_ROLE,
            DEFAULT_USER_STATUS,
            get_current_datetime(),))
    return get_user_by_username(user.username)


def update_user_password_by_id(user_id, password):
    cursor = get_cursor()
    hashed_password = hashing.hash_value(password, PASSWORD_SALT)
    cursor.execute('UPDATE users SET password_hash = %s WHERE user_id = %s', (hashed_password, user_id))


def is_user_password_valid_by_id(user_id, password):
    cursor = get_cursor()
    cursor.execute('SELECT password_hash FROM users WHERE user_id = %s', (user_id,))
    user = cursor.fetchone()
    return user['password_hash'] == hashing.hash_value(password, PASSWORD_SALT)


def is_user_password_valid_by_username(username, password):
    cursor = get_cursor()
    cursor.execute('SELECT password_hash FROM users WHERE username = %s', (username,))
    user = cursor.fetchone()
    return user['password_hash'] == hashing.hash_value(password, PASSWORD_SALT)


def update_user_status(user_id, status):
    cursor = get_cursor()
    cursor.execute('UPDATE users SET status = %s WHERE user_id = %s', (status, user_id))
    return get_user_by_id(user_id)


def update_user_role(user_id, role):
    cursor = get_cursor()
    cursor.execute('UPDATE users SET role = %s WHERE user_id = %s', (role, user_id))
    return get_user_by_id(user_id)
