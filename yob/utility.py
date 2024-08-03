import random
import string
from datetime import datetime


def get_current_datetime():
    return datetime.now()


def random_string(length=32):
    """Generate a random string of specified length."""
    # Define the character set (uppercase, lowercase letters, and digits)
    characters = string.ascii_letters + string.digits

    # Generate a random string using the character se
    return ''.join(random.choice(characters) for _ in range(length))


def are_fields_present(request, required_fields):
    return all(field in request.form and request.form[field] for field in required_fields)
