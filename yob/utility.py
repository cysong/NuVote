import random
import string
from datetime import datetime


def get_current_datetime():
    """Return the current date and time."""
    return datetime.now()


def random_string(length=32):
    """Generate a random string of specified length."""
    # Define the character set (uppercase, lowercase letters, and digits)
    characters = string.ascii_letters + string.digits

    # Generate a random string using the character se
    return ''.join(random.choice(characters) for _ in range(length))


def are_fields_present(request, required_fields):
    """Check if all required fields are present in the request."""
    return all(field in request.form and len(request.form[field]) >= 0 for field in required_fields)


def get_locale_from_request(request):
    """
    Determine the best matching locale based on the Accept-Language header.
    """
    supported_locales = [
        'en_NZ.UTF-8', 'fr_FR.UTF-8', 'de_DE.UTF-8',
        'es_ES.UTF-8', 'zh_CN.UTF-8', 'zh_TW.UTF-8'
    ]

    # Extract the language code from the Accept-Language header
    best_match = request.accept_languages.best_match(['en', 'fr', 'de', 'es', 'zh'])

    # Map the best match to a locale name
    locale_map = {
        'en': 'en_NZ.UTF-8',  # New Zealand English
        'fr': 'fr_FR.UTF-8',  # French
        'de': 'de_DE.UTF-8',  # German
        'es': 'es_ES.UTF-8',  # Spanish
        'zh': 'zh_CN.UTF-8',  # Simplified Chinese
        'zh-Hant': 'zh_TW.UTF-8',  # Traditional Chinese
    }

    return locale_map.get(best_match, 'en_NZ.UTF-8')
