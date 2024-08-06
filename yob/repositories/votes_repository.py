from yob.database import Cursor

def get_vote_by_id(vote_id):
    """
    Retrieve a vote by its ID, including the username of the voter
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                v.vote_id,
                v.competition_id,
                v.competitor_id,
                v.voted_by,
                u.username AS voted_by_username,
                v.status,
                v.voted_ip,
                v.voted_at
            FROM 
                votes v
                JOIN users u ON v.voted_by = u.user_id
            WHERE 
                v.vote_id = %s
        """, (vote_id,))
        vote = cursor.fetchone()
    return vote

def create_vote(vote):
    """
    Create a new vote
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            INSERT INTO votes (competition_id, competitor_id, voted_by, status, voted_ip)
            VALUES (%s, %s, %s, %s, %s)
        """, (
            vote['competition_id'],
            vote['competitor_id'],
            vote['voted_by'],
            vote['status'],
            vote['voted_ip']
        ))
        vote_id = cursor.lastrowid
    return vote_id

def set_vote_status(vote_id, status):
    """
    Set the status of a vote (valid/invalid)
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            UPDATE votes
            SET status = %s
            WHERE vote_id = %s
        """, (status, vote_id))
        affected_rows = cursor.rowcount
    return affected_rows > 0

def get_daily_votes_by_competition(competition_id):
    """
    Retrieve the daily number of new votes for a competition
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                DATE(v.voted_at) AS vote_date,
                COUNT(*) AS vote_count
            FROM 
                votes v
            WHERE 
                v.competition_id = %s AND v.status = 'valid'
            GROUP BY 
                DATE(v.voted_at)
            ORDER BY 
                vote_date
        """, (competition_id,))
        daily_votes = cursor.fetchall()
    return daily_votes

def get_votes_by_competitor_id(competitor_id):
    """
    Retrieve all votes for a specific competitor, ordered by time
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                v.vote_id,
                v.competition_id,
                v.voted_by,
                v.status,
                v.voted_ip,
                v.voted_at
            FROM 
                votes v
            WHERE 
                v.competitor_id = %s
            ORDER BY 
                v.voted_at DESC
        """, (competitor_id,))
        votes = cursor.fetchall()
    return votes

def get_votes_by_competition_and_ip(competition_id, voted_ip):
    """
    Retrieve all votes for a specific competition and IP address, including the username of the voter
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                v.vote_id,
                v.competition_id,
                v.competitor_id,
                v.voted_by,
                u.username AS voted_by_username,
                v.status,
                v.voted_ip,
                v.voted_at
            FROM 
                votes v
                JOIN users u ON v.voted_by = u.user_id
            WHERE 
                v.competition_id = %s AND v.voted_ip = %s
        """, (competition_id, voted_ip))
        votes = cursor.fetchall()
    return votes

def get_votes_by_ip_for_competition(competition_id):
    """
    Retrieve the number of votes per IP address for a specific competition,
    ordered by the number of votes in descending order
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                v.voted_ip,
                COUNT(*) AS vote_count
            FROM 
                votes v
            WHERE 
                v.competition_id = %s AND v.status = 'valid'
            GROUP BY 
                v.voted_ip
            ORDER BY 
                vote_count DESC
        """, (competition_id,))
        votes_by_ip = cursor.fetchall()
    return votes_by_ip

def invalidate_votes_by_ip_for_competition(competition_id, voted_ip):
    """
    Invalidate all votes for a specific IP address in a competition
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            UPDATE votes
            SET status = 'invalid'
            WHERE competition_id = %s AND voted_ip = %s
        """, (competition_id, voted_ip))
        affected_rows = cursor.rowcount
    return affected_rows > 0
