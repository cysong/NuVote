from flask import render_template

from yob import app


@app.errorhandler(400)
def bad_request(e):
    # Render custom 400 error page
    return render_template('400.html'), 400


@app.errorhandler(404)
def page_not_found(e):
    # Render custom 404 error page
    return render_template('404.html'), 404


@app.errorhandler(500)
def internal_server_error(e):
    # Render custom 500 error page
    return render_template('500.html'), 500
