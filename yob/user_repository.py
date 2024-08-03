import mysql.connector

from yob import connect
from yob.config import DEFAULT_PROFILE_IMAGES_FOLDER, DEFAULT_USER_ROLE, DEFAULT_USER_STATUS
from yob.utility import get_current_datetime


class User:
    def __init__(self, username, first_name, last_name, location, email, description, password_hash):
        self.username = username
        self.first_name = first_name
        self.last_name = last_name
        self.location = location
        self.email = email
        self.description = description
        self.password_hash = password_hash


db_connection = None


def get_cursor():
    """Gets a new dictionary cursor for the database.

    If necessary, a new database connection be created here and used for all
    subsequent to getCursor()."""
    global db_connection

    if db_connection is None or not db_connection.is_connected():
        db_connection = mysql.connector.connect(user=connect.dbuser,
                                                password=connect.dbpass,
                                                host=connect.dbhost,
                                                auth_plugin='mysql_native_password',
                                                database=connect.dbname,
                                                autocommit=True)

    cursor = db_connection.cursor(dictionary=True)

    return cursor


def get_users():
    cursor = get_cursor()
    cursor.execute(
        '''SELECT u.user_id, u.username, u.email, u.first_name AS firstname, u.last_name AS lastname, 
                  u.description, u.location, u.profile_image, 
                  u.role, u.status 
           FROM users u 
           ORDER BY u.user_id'''
    )
    users = cursor.fetchall()
    # Update the profile_image path for each user if it exists
    users = [handle_default_profile(user) for user in users]
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
    return handle_default_profile(user)


def get_user_by_username(username):
    # We need all the account info for the user, so we can display it on the profile page
    cursor = get_cursor()
    cursor.execute(
        'SELECT user_id, username, first_name, last_name, location,email,description, profile_image, '
        'role, status, created_at FROM users WHERE username = %s',
        (username,))
    user = cursor.fetchone()
    # Set default Profile Image
    return handle_default_profile(user)


def get_user_by_email(email):
    # We need all the account info for the user, so we can display it on the profile page
    cursor = get_cursor()
    cursor.execute(
        'SELECT user_id, username, first_name, last_name, location,email,description, profile_image, '
        'role, status, created_at FROM users WHERE email = %s',
        (email,))
    user = cursor.fetchone()
    # Set default Profile Image
    return handle_default_profile(user)


def handle_default_profile(user):
    # Set default Profile Image
    if user['profile_image'] == '':
        user['profile_image'] = f"/{DEFAULT_PROFILE_IMAGES_FOLDER}/default_profile.png"
    else:
        user['profile_image'] = f"/{DEFAULT_PROFILE_IMAGES_FOLDER}/{user['profile_image']}"
    return user


def create_user(user: User):
    cursor = get_cursor()
    cursor.execute(
        'INSERT INTO users (username, first_name, last_name, location, email, description, profile_image,'
        'password_hash, role, status,created_at) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)',
        (
            user.username, user.first_name, user.last_name, user.location, user.email, user.description,
            user.profile_image,
            user.password_hash,
            DEFAULT_USER_ROLE,
            DEFAULT_USER_STATUS,
            get_current_datetime(),))
    return get_user_by_username(user.username)
