from yob.database import Cursor


def update_competition_image_update(competition_id, competition_image):
    '''Store the img_url in the database'''
    with Cursor() as cursor:
        cursor.execute("""
            UPDATE competitions
            SET image = %s
            WHERE competition_id = %s
        """, (competition_image, competition_id))
        affected_rows = cursor.rowcount
    return affected_rows > 0
