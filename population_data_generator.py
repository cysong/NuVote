from yob.config import DEFAULT_VOTE_STATUS
from yob.database import Cursor
from yob.repositories.competition_repository import get_all_competitions, get_competition_by_id
from yob.repositories.competitors_repository import get_competitors_by_competition_id
import random
import datetime

IP_TEMPLATE = '10.{}.{}.{}'


def create_votes(votes):
    """
    Create multiple new votes
    """
    # Prepare the query for batch insertion
    insert_query = """
        INSERT INTO votes (competition_id, competitor_id, voted_by, status, voted_ip, voted_at)
        VALUES (%s, %s, %s, %s, %s, %s)
    """

    # Prepare the values for each vote in a list of tuples
    values = [
        (
            vote['competition_id'],
            vote['competitor_id'],
            vote['voted_by'],
            DEFAULT_VOTE_STATUS,
            vote['voted_ip'],
            vote['created_at']
        )
        for vote in votes
    ]

    with Cursor() as cursor:
        # Execute batch insertion
        cursor.executemany(insert_query, values)


def select_user_ids_not_voted(competition_id):
    """
    Select user ids that have not voted yet
    """
    with Cursor() as cursor:
        cursor.execute("""
            SELECT user_id
            FROM users u
            WHERE user_id NOT IN (
                SELECT voted_by
                FROM votes v, competitors c
                WHERE v.competitor_id=c.competitor_id and c.competition_id = %s
            ) and u.role='voter'
        """, (competition_id,))
        user_ids = cursor.fetchall()
    return user_ids


def random_date(start, end):
    """
    Generate a random datetime between `start` and `end` dates.
    """
    # Calculate the total number of seconds between start and end
    delta = end - start
    int_delta = int(delta.total_seconds())

    # Generate a random number of seconds to add to the start date
    random_seconds = random.randint(0, int_delta)

    # Add the random seconds to the start date to get the random date
    random_date = start + datetime.timedelta(seconds=random_seconds)

    return random_date


def random_weights(length):
    """
    Generate random weights that sum up to 1
    """
    return [random.random() for _ in range(length)]


def generate_votes_for_competition(competition_id, legal_votes_count=50, illegal_votes_count=30):
    """ Generate votes for a competition, legal and illegal votes"""
    competition = get_competition_by_id(competition_id)
    if not competition:
        print(f'competition with id {competition_id} not found')
        return
    if competition['status'] in ('draft', 'in_plan'):
        print(f'competition with id {competition_id} is {competition["status"]}, ignore')
        return
    if not (competition['start_date'] and competition['end_date']):
        print(f'competition with id {competition_id} has no start and end dates')
        return

    user_ids = select_user_ids_not_voted(competition_id)
    if len(user_ids) < legal_votes_count + illegal_votes_count:
        print(f'not enough users to generate votes for competition {competition_id}')
        return

    competitors = get_competitors_by_competition_id(competition_id)

    votes = []
    weights = random_weights(len(competitors))
    for i in range(legal_votes_count):
        user_id = user_ids[i]['user_id']
        competitor = random.choices(competitors, weights=weights)[0]
        ip = IP_TEMPLATE.format(competition_id, i//256, i % 256)
        created_at = random_date(competition['start_date'], competition['end_date'])
        vote = {
            'competition_id': competition_id,
            'competitor_id': competitor['competitor_id'],
            'voted_by': user_id,
            'voted_ip': ip,
            'created_at': created_at
        }
        # print(str(vote))
        votes.append(vote)
    
    # Pick 3 competitors to cheat, with 3 different ips
    competitors_cheating = random.sample(competitors, k=3)
    weights_chating = random_weights(3)
    ips = [IP_TEMPLATE.format(competition_id, 200, random.randint(0, 255)) for _ in range(3)]
    for i in range(illegal_votes_count):
        user_id = user_ids[legal_votes_count + i]['user_id']
        competitor = random.choices(competitors_cheating, weights=weights_chating)[0]
        created_at = random_date(competition['start_date'], competition['end_date'])
        vote = {
            'competition_id': competition_id,
            'competitor_id': competitor['competitor_id'],
            'voted_by': user_id,
            'voted_ip': random.choice(ips),
            'created_at': created_at
        }
        votes.append(vote)
    if votes:
        create_votes(votes)

    print(f'Generated {legal_votes_count} legal and {illegal_votes_count} illegal votes for competition {competition_id}')

def generate_votes_for_all_competitions(legal_votes_count=50, illegal_votes_count=30):
    """Generate all votes for all competitions, legal and illegal votes"""
    competitions = get_all_competitions()
    for competition in competitions:
        generate_votes_for_competition(competition['competition_id'], legal_votes_count, illegal_votes_count)


if __name__ == "__main__":
    # generate_votes_for_competition(1)
    generate_votes_for_all_competitions()
