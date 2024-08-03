from flask import render_template

from yob import app


# Route for login page (supports both GET and POST requests)
@app.route('/')
def index():
    # Show the login form with message (if any)
    return render_template('index.html')
