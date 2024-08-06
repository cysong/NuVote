from yob.database import Cursor

def get_competitor_by_id(competitor_id):
    """
    Retrieve a competitor by their ID
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT * FROM competitors
            WHERE competitor_id = %s
        """, (competitor_id,))
        competitor = cursor.fetchone()
    return competitor

def create_competitor(competitor):
    """
    Create a new competitor
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            INSERT INTO competitors (name, description, image, competition_id, status, author, create_by)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (
            competitor['name'],
            competitor['description'],
            competitor['image'],
            competitor['competition_id'],
            competitor['status'],
            competitor['author'],
            competitor['create_by']
        ))
        competitor_id = cursor.lastrowid
    return competitor_id

def update_competitor(competitor_id, competitor):
    """
    Update competitor information based on competitor_id
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            UPDATE competitors
            SET name = %s, description = %s, image = %s, status = %s, author = %s
            WHERE competitor_id = %s
        """, (
            competitor['name'],
            competitor['description'],
            competitor['image'],
            competitor['status'],
            competitor['author'],
            competitor_id
        ))
        affected_rows = cursor.rowcount
    return affected_rows > 0

def get_all_competitors():
    """
    Retrieve all competitors, ordered by creation time
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT * FROM competitors
            ORDER BY created_at
        """)
        competitors = cursor.fetchall()
    return competitors

def get_competitors_by_competition_id(competition_id):
    """
    Retrieve competitors by their competition_id
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT * FROM competitors
            WHERE competition_id = %s order by created_at
        """, (competition_id,))
        competitors = cursor.fetchall()
    return competitors
