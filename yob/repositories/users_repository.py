from flask_hashing import Hashing

from yob.config import DEFAULT_USER_STATUS, DEFAULT_PROFILE_IMAGE, DEFAULT_PASSWORD_SALT, MAX_LATEST_VOTE_USERS
from yob.database import Cursor
from yob.utility import get_current_datetime

PASSWORD_SALT = DEFAULT_PASSWORD_SALT
hashing = Hashing()


class User:
    def __init__(self, username, first_name, last_name, location, email, description, password, role):
        self.username = username
        self.first_name = first_name
        self.last_name = last_name
        self.location = location
        self.email = email
        self.description = description
        self.password = password
        self.role = role


def get_users():
    '''Retrieve all users'''
    with Cursor() as cursor:
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
    '''Retrieve user information based on user_id'''

    # We need all the user info for the user, so we can display it on the profile page
    with Cursor() as cursor:
        cursor.execute(
            'SELECT user_id, username, first_name, last_name, location,email,description, profile_image, '
            'role, status, created_at FROM users WHERE user_id = %s',
            (user_id,))
        user = cursor.fetchone()
    # Set default Profile Image
    return user


def get_user_by_username(username):
    '''Retrieve user information based on username'''

    # We need all the account info for the user, so we can display it on the profile page
    with Cursor() as cursor:
        cursor.execute(
            'SELECT user_id, username, first_name, last_name, '
            'location,email,description, profile_image, role, status, '
            'created_at FROM users WHERE username = %s',
            (username,))
        user = cursor.fetchone()
    # Set default Profile Image
    return user


def get_password_by_username(username):
    '''Retrieve user information based on username'''

    # We need all the account info for the user, so we can display it on the profile page
    with Cursor() as cursor:
        cursor.execute(
            'SELECT password_hash FROM users WHERE username = %s',
            (username,))
        user = cursor.fetchone()
    # Set default Profile Image
    return user


def get_user_by_email(email):
    '''Retrieve user information based on email'''

    # We need all the account info for the user, so we can display it on the profile page
    with Cursor() as cursor:
        cursor.execute(
            'SELECT user_id, username, first_name, last_name, location,email,description, profile_image, '
            'role, status, created_at FROM users WHERE email = %s',
            (email,))
        user = cursor.fetchone()
    # Set default Profile Image
    return user


def handle_default_profile(user):
    '''Handle default profile image'''
    if user is None:
        return None
    # Set default Profile Image
    if user['profile_image'] == '':
        user['profile_image'] = DEFAULT_PROFILE_IMAGE
    # else:
    #     user['profile_image'] = f"/{DEFAULT_PROFILE_IMAGES_FOLDER}/{user['profile_image']}"
    return user


def create_user(user: User):
    '''Create a new user'''
    with Cursor() as cursor:
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
                DEFAULT_PROFILE_IMAGE,
                hashing.hash_value(user.password, PASSWORD_SALT),
                user.role,
                DEFAULT_USER_STATUS,
                get_current_datetime(),))
    return get_user_by_username(user.username)


def update_user_password_by_id(user_id, password):
    '''Update user password based on user_id'''
    hashed_password = hashing.hash_value(password, PASSWORD_SALT)
    with Cursor() as cursor:
        cursor.execute('UPDATE users SET password_hash = %s WHERE user_id = %s', (hashed_password, user_id))


def is_user_password_valid_by_id(user_id, password):
    '''Check if user password is valid based on user_id'''
    with Cursor() as cursor:
        cursor.execute('SELECT password_hash FROM users WHERE user_id = %s', (user_id,))
        user = cursor.fetchone()
    return user['password_hash'] == hashing.hash_value(password, PASSWORD_SALT)


def is_user_password_valid_by_username(username, password):
    '''Check if user password is valid based on username'''
    with Cursor() as cursor:
        cursor.execute('SELECT password_hash FROM users WHERE username = %s', (username,))
        user = cursor.fetchone()
    return user['password_hash'] == hashing.hash_value(password, PASSWORD_SALT)


def update_user_status(user_id, status):
    '''Update user status'''
    with Cursor() as cursor:
        cursor.execute('UPDATE users SET status = %s WHERE user_id = %s', (status, user_id))
    return get_user_by_id(user_id)


def update_user_role(user_id, role):
    '''Update user role'''
    with Cursor() as cursor:
        cursor.execute('UPDATE users SET role = %s WHERE user_id = %s', (role, user_id))
    return get_user_by_id(user_id)


def check_username_exists(username):
    """Check if username exists"""
    with Cursor() as cursor:
        cursor.execute(
            "SELECT COUNT(*) FROM users WHERE username = %s", (username,))
        exists = cursor.fetchone()[0] > 0
    return exists


def check_email_exists(email):
    """Check if email exists"""
    with Cursor() as cursor:
        cursor.execute(
            "SELECT COUNT(*) FROM users WHERE email = %s", (email,))
        exists = cursor.fetchone()[0] > 0
    return exists


def update_user(user):
    """
    Update user information based on user_id
    """
    with Cursor() as cursor:
        cursor.execute("""
            UPDATE users
            SET email = %s, first_name = %s, last_name = %s, location = %s, description = %s, status = %s, role = %s
            WHERE user_id = %s
        """, (
            user['email'],
            user['first_name'],
            user['last_name'],
            user['location'],
            user['description'],
            user['status'],
            user['role'],
            user['user_id']
        ))
        affected_rows = cursor.rowcount
    return affected_rows > 0


def update_profile_image(user_id, profile_image):
    """
    Update the profile image URL for a user based on user_id.
    """
    with Cursor() as cursor:
        cursor.execute("""
            UPDATE users
            SET profile_image = %s
            WHERE user_id = %s
        """, (profile_image, user_id))
        affected_rows = cursor.rowcount
    return affected_rows > 0

def get_latest_voted_users():
    """
    Get the latest voted users
    """
    with Cursor() as cursor:
        cursor.execute(
            '''SELECT u.* 
            FROM users u, votes v where u.user_id = v.voted_by and u.status='active'
            ORDER BY v.voted_at desc limit %s''', (MAX_LATEST_VOTE_USERS,)
        )
        users = cursor.fetchall()
    return users