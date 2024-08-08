from yob.database import Cursor


def get_competition_by_id(competition_id):
    """
    Retrieve a competition by its ID
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT * FROM competitions
            WHERE competition_id = %s
        """, (competition_id,))
        competition = cursor.fetchone()
    return competition


def create_competition(competition):
    """
    Create a new competition
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            INSERT INTO competitions (name, description, image, start_date, end_date, status, create_by)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (
            competition['name'],
            competition['description'],
            competition['image'],
            competition['start_date'],
            competition['end_date'],
            competition['status'],
            competition['create_by']
        ))
        competition_id = cursor.lastrowid
    return competition_id


def update_competition(competition_id, competition):
    """
    Update competition information based on competition_id
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            UPDATE competitions
            SET name = %s, description = %s, image = %s, start_date = %s, end_date = %s, status = %s
            WHERE competition_id = %s
        """, (
            competition['name'],
            competition['description'],
            competition['image'],
            competition['start_date'],
            competition['end_date'],
            competition['status'],
            competition_id
        ))
        affected_rows = cursor.rowcount
    return affected_rows > 0


def update_competition_status(competition_id, status):
    """
    Update the status of a competition
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            UPDATE competitions
            SET status = %s
            WHERE competition_id = %s
        """, (
            status,
            competition_id
        ))
        affected_rows = cursor.rowcount
    return affected_rows > 0


def get_all_competitions():
    """
    Retrieve all competitions
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT * FROM competitions order by start_date
        """)
        competitions = cursor.fetchall()
    return competitions


def delete_competition(competition_id):
    """
    Delete a competition by its ID
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            DELETE FROM competitions
            WHERE competition_id = %s
        """, (competition_id,))
        affected_rows = cursor.rowcount
    return affected_rows > 0


def get_recent_competitions():
    """
    Get recent competitions including:
    - Currently ongoing competitions
    - Competitions ended within the past week
    - Competitions starting within the next week
    Results are ordered by start_date in descending order.
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT *
            FROM competitions
            WHERE 
                (start_date <= NOW() AND end_date >= NOW())
                OR (end_date BETWEEN NOW() - INTERVAL 1 MONTH and NOW())
                OR (start_date BETWEEN NOW() AND NOW() + INTERVAL 1 MONTH)
            ORDER BY start_date DESC
        """)
        recent_competitions = cursor.fetchall()
    return recent_competitions
