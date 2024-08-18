from yob.config import DEFAULT_PROFILE_IMAGE
from yob.database import Cursor


def handle_profile_image_update(user_id, profile_path=DEFAULT_PROFILE_IMAGE):
    '''Store the img_url in the database'''
    with Cursor() as cursor:
        cursor.execute("UPDATE users SET profile_image = %s WHERE user_id = %s",
                       (f"{profile_path}", user_id))
        cursor.rowcount
