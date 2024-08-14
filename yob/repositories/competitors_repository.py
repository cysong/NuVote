from yob.database import Cursor


def get_competitor_by_id(competitor_id):
    """
    Retrieve a competitor by their ID
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT a.*,b.name competition_name FROM competitors a, competitions b 
            WHERE a.competition_id=b.competition_id and competitor_id = %s
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


def update_competitor(competitor):
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
            competitor['competitor_id']
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


def get_competitors_with_valid_votes(competition_id):
    """
    Retrieve all competitors in a competition with their total valid votes
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                c.competitor_id,
                c.name,
                c.description,
                c.image,
                c.status,
                c.author,
                c.created_at,
                IFNULL(v.vote_count, 0) AS vote_count
            FROM 
                competitors c
                LEFT JOIN (
                    SELECT competitor_id, COUNT(*) AS vote_count 
                    FROM votes 
                    WHERE competition_id = %s AND status = 'valid'
                    GROUP BY competitor_id
                ) v ON c.competitor_id = v.competitor_id
            WHERE 
                c.competition_id = %s
            ORDER BY 
                c.created_at DESC
        """, (competition_id, competition_id))

        competitors = cursor.fetchall()
    return competitors


def get_competitors_with_votes_percentage(competition_id):
    """
    Retrieve all competitors in a competition with their total valid votes and vote count percentage
    """
    with Cursor(dictionary=True) as cursor:
        # Calculate total valid votes for the competition
        cursor.execute("""
            SELECT COUNT(*) AS total_votes
            FROM votes 
            WHERE competition_id = %s AND status = 'valid'
        """, (competition_id,))
        total_votes = cursor.fetchone()['total_votes']

        # Retrieve competitors with their valid vote counts and calculate percentage
        cursor.execute("""
            SELECT 
                c.competitor_id,
                c.name,
                c.description,
                c.image,
                c.status,
                c.author,
                c.created_at,
                IFNULL(v.vote_count, 0) AS vote_count,
                IFNULL((v.vote_count / %s) * 100, 0) AS vote_percentage
            FROM 
                competitors c
                LEFT JOIN (
                    SELECT competitor_id, COUNT(*) AS vote_count 
                    FROM votes 
                    WHERE competition_id = %s AND status = 'valid'
                    GROUP BY competitor_id
                ) v ON c.competitor_id = v.competitor_id
            WHERE 
                c.competition_id = %s
            ORDER BY 
                vote_percentage DESC
        """, (total_votes, competition_id, competition_id))

        competitors = cursor.fetchall()
    return competitors


def get_competitors_and_votes(competition_id, user_id):
    """
    Retrieve all competitors in a competition with their total votes
    and check if the specified user has voted for each competitor.
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                c.competitor_id,
                c.name,
                c.description,
                c.image,
                c.status,
                c.author,
                c.created_at,
                IFNULL(v.vote_count, 0) AS vote_count,
                IF(EXISTS(
                    SELECT 1 FROM votes v2 
                    WHERE v2.competitor_id = c.competitor_id AND v2.voted_by = %s
                ), 1, 0) AS has_voted
            FROM 
                competitors c
                LEFT JOIN (
                    SELECT competitor_id, COUNT(*) AS vote_count 
                    FROM votes 
                    GROUP BY competitor_id
                ) v ON c.competitor_id = v.competitor_id
            WHERE 
                c.competition_id = %s
            ORDER BY 
                c.created_at DESC
        """, (user_id, competition_id))

        competitors = cursor.fetchall()
    return competitors

def delete_competitor(competitor_id):
    """
    Delete a competitor by its ID
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            DELETE FROM competitors
            WHERE competitor_id = %s
        """, (competitor_id,))
        affected_rows = cursor.rowcount
    return affected_rows > 0