# COMP639S2_project_1_Nu
# lucy long testing!
# Tong Ye joined!
# Hong joined!

## Introduction

Year of Bird(YOB) is a web application built with Flask for managing user profiles, votes, and more. This application supports user registration, login, profile management, voting, and administrative functions.

## Features

- User authentication (login, registration, logout)
- User profile management
- competition setup
- vote
- Admin and moderator roles
- Profile image upload and deletion
- Error handling pages for common HTTP errors (400, 404, 500)

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Python 3.x
- pip (Python package installer)
- MySQL or compatible database

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/yourusername/COMP639S2_project_1_Nu.git
    cd COMP639S2_project_1_Nu
    ```

2. Create a virtual environment and activate it:

    ```sh
    python -m venv venv
    source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
    ```

3. Install the required Python packages:

    ```sh
    pip install -r requirements.txt
    ```

4. Configure the database connection. Create a `connect.py` file in the project root with your database settings:

    ```python
    DB_HOST = 'localhost'
    DB_USER = 'your_db_user'
    DB_PASSWORD = 'your_db_password'
    DB_NAME = 'your_db_name'
    SECRET_KEY = 'your_secret_key'
    ```

5. Initialize the database with the required tables. You can find the SQL scripts in the `sql/` directory. Run the scripts using your preferred method (e.g., MySQL Workbench, command line).

## Running the Application

1. Ensure your MySQL database server is running and accessible.

2. Start the Flask application:

    ```sh
    FLASK_APP=run.py flask run
    ```

3. Open your web browser and navigate to `http://localhost:5000`.

## Usage

### User Registration

- Navigate to the registration page (`http://localhost:5000/register`).
- Fill in the required fields and submit the form to create a new account.

### User Login

- Navigate to the login page (`http://localhost:5000/login`).
- Enter your username and password to log in.

### Profile Management

- After logging in, navigate to your profile page (`http://localhost:5000/profile/<your_user_id>`).
- Update your profile information and save changes.

### Admin Functions

- Admin users can access the admin home page (`http://localhost:5000/users`) to manage user accounts.

## Project Structure

- `app/`: Contains the Flask application modules and templates
- `static/`: Static files (e.g., CSS, JavaScript, images)
- `templates/`: HTML templates for rendering pages
- `yob/`: Application logic and utility functions
- `tests`: Test functions
- `config.py`: Configuration settings for the application
- `connect.py`: Database settings for the application
- `requirements.txt`: Python dependencies

## Testing


## Contributing

Contributions are welcome! Please submit a pull request