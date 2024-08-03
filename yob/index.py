from flask import render_template

from yob import app


# Route for home page (supports both GET request)
@app.route('/')
def index():
    # Show the index/home page
    return render_template('index.html')
