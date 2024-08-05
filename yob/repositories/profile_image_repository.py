from yob.config import DEFAULT_PROFILE_IMAGE_PATH, DEFAULT_PROFILE_IMAGES_FOLDER
from yob.repositories.users_repository import get_cursor


def handle_profile_image_update(user_id, profile_path=DEFAULT_PROFILE_IMAGE_PATH):
    # Store the img_url in the database
    cursor = get_cursor()
    cursor.execute("UPDATE users SET profile_image = %s WHERE user_id = %s",
                   (f"/{DEFAULT_PROFILE_IMAGES_FOLDER}/{profile_path}", user_id))
