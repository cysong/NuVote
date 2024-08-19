from yob.database import Cursor


def get_vote_by_id(vote_id):
    """
    Retrieve a vote by its ID, including the username of the voter
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                v.vote_id,
                c.competition_id,
                v.competitor_id,
                v.voted_by,
                u.username AS voted_by_username,
                v.status,
                v.voted_ip,
                v.voted_at
            FROM 
                votes v
                JOIN users u ON v.voted_by = u.user_id
                join competitors c on v.competitor_id = c.competitor_id
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
    Retrieve the daily number of valid and invalid votes for a competition
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                DATE(v.voted_at) AS vote_date,
                SUM(CASE WHEN v.status = 'valid' THEN 1 ELSE 0 END) AS valid_votes,
                SUM(CASE WHEN v.status = 'invalid' THEN 1 ELSE 0 END) AS invalid_votes
            FROM 
                votes v, competitors c
            WHERE 
                v.competitor_id = c.competitor_id AND c.competition_id = %s
            GROUP BY 
                DATE(v.voted_at)
            ORDER BY 
                vote_date
        """, (competition_id,))
        daily_votes = cursor.fetchall()
    return daily_votes

def get_daily_valid_votes_by_competitor_and_competition(competition_id):
    """
    Retrieve the daily number of valid votes for each competitor in a specific competition.
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                DATE(v.voted_at) AS vote_date,
                v.competitor_id,
                c.name AS competitor_name,
                COUNT(*) AS valid_votes
            FROM 
                votes v
                JOIN competitors c ON v.competitor_id = c.competitor_id
            WHERE 
                c.competition_id = %s AND v.status = 'valid'
            GROUP BY 
                DATE(v.voted_at), v.competitor_id
            ORDER BY 
                vote_date, v.competitor_id
        """, (competition_id,))
        daily_valid_votes_by_competitor = cursor.fetchall()
    return daily_valid_votes_by_competitor


def get_votes_by_competitor_id(competitor_id):
    """
    Retrieve all votes for a specific competitor, ordered by time
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                v.vote_id,
                c.competition_id,
                v.voted_by,
                v.status,
                v.voted_ip,
                v.voted_at
            FROM 
                votes v, competitors c
            WHERE 
                v.competitor_id = c.competitor_id AND
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
                c.competition_id,
                v.competitor_id,
                v.voted_by,
                u.username AS voted_by_username,
                v.status,
                v.voted_ip,
                v.voted_at
            FROM 
                votes v
                JOIN users u ON v.voted_by = u.user_id
                join competitors c on v.competitor_id = c.competitor_id
            WHERE 
                c.competition_id = %s AND v.voted_ip = %s
        """, (competition_id, voted_ip))
        votes = cursor.fetchall()
    return votes


def get_votes_group_by_ip_for_competition(competition_id):
    """
    Retrieve the number of total votes and valid votes per IP address for a specific competition,
    ordered by the total number of votes in descending order
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                v.voted_ip,
                COUNT(*) AS total_votes,
                SUM(CASE WHEN v.status = 'valid' THEN 1 ELSE 0 END) AS valid_votes,
                count(distinct v.competitor_id) as distinct_competitors
            FROM 
                votes v, competitors c
            WHERE 
                v.competitor_id = c.competitor_id AND c.competition_id = %s
            GROUP BY 
                v.voted_ip
            ORDER BY 
                total_votes DESC
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


def get_votes_by_competition_and_user(competition_id, user_id):
    """
    Retrieve all votes for a specific competition and user, including the username of the voter
    """
    with Cursor(dictionary=True) as cursor:
        cursor.execute("""
            SELECT 
                v.vote_id,
                c.competition_id,
                v.competitor_id,
                v.voted_by,
                v.status,
                v.voted_ip,
                v.voted_at
            FROM 
                votes v, competitors c
            WHERE 
                v.competitor_id = c.competitor_id AND c.competition_id = %s AND v.voted_by = %s
        """, (competition_id, user_id))
        votes = cursor.fetchall()
    return votes

def get_votes_by_filters(competition_id, ip=None, status='valid', competitor_id=None):
    '''Retrieve votes based on competition_id, ip, status, and competitor_id'''
    # CONVERT_TZ: jsonify force convert time to GMT no matter what time zone is
    query = """
        SELECT 
            v.vote_id,
            c.competition_id,
            v.competitor_id,
            v.voted_by,
            u.username AS voted_by_username,
            u.first_name as voted_by_first_name,
            u.last_name as voted_by_last_name,
            v.status,
            v.voted_ip,
            CONVERT_TZ(v.voted_at, @@session.time_zone, '+00:00') voted_at,
            c.name AS competitor_name
        FROM 
            votes v
            JOIN users u ON v.voted_by = u.user_id
            JOIN competitors c ON v.competitor_id = c.competitor_id
        WHERE 
            c.competition_id = %s AND v.status = %s
    """
    params = [competition_id, status]
    
    if ip:
        query += " AND v.voted_ip = %s"
        params.append(ip)
    
    if competitor_id:
        query += " AND v.competitor_id = %s"
        params.append(competitor_id)

    with Cursor(dictionary=True) as cursor:
        cursor.execute(query, params)
        votes = cursor.fetchall()
    return votes

def abandon_vote_by_id(vote_id):
    '''Set the status of a vote to invalid'''
    with Cursor() as cursor:
        cursor.execute("UPDATE votes SET status = 'invalid' WHERE vote_id = %s AND status = 'valid'", (vote_id,))
        return cursor.rowcount

def abandon_votes_by_ids(vote_ids):
    '''Set the status of multiple votes to invalid'''
    placeholders = ', '.join(['%s'] * len(vote_ids))
    with Cursor() as cursor:
        cursor.execute(f"UPDATE votes SET status = 'invalid' WHERE vote_id IN ({placeholders}) AND status = 'valid'", vote_ids)
        return cursor.rowcount

def abandon_votes_by_ip(ip):
    '''Set the status of all votes from an IP address to invalid'''
    with Cursor() as cursor:
        cursor.execute("UPDATE votes SET status = 'invalid' WHERE voted_ip = %s AND status = 'valid'", (ip,))
        return cursor.rowcount