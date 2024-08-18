from yob.database import Cursor


class UserProfile:
    def __init__(self, first_name, last_name, location, email, description):
        self.first_name = first_name
        self.last_name = last_name
        self.location = location
        self.email = email
        self.description = description


def update_profile_by_user_id(user_id, profile: UserProfile):
    '''Update user profile in the database'''
    # Extract form data
    first_name = profile.first_name
    last_name = profile.last_name
    location = profile.location
    email = profile.email
    description = profile.description
    # Update user profile in the database
    with Cursor() as cursor:
        cursor.execute(
            'UPDATE users SET email = %s, first_name = %s, last_name = %s, description = %s, location = %s '
            'WHERE user_id = %s',
            (email, first_name, last_name, description, location, user_id)
        )
