import logging

from flask import render_template

from . import bp


@bp.app_errorhandler(400)
def bad_request(e):
    '''Render custom 400 error page'''
    return render_template('error/400.html'), 400


@bp.app_errorhandler(403)
def bad_request(e):
    '''Render custom 403 error page'''
    return render_template('error/403.html'), 403


@bp.app_errorhandler(404)
def page_not_found(e):
    '''Render custom 404 error page'''
    return render_template('error/404.html'), 404


@bp.app_errorhandler(500)
def internal_server_error(e):
    '''Render custom 500 error page'''
    return render_template('error/500.html'), 500


@bp.app_errorhandler(Exception)
def handle_exception(e):
    '''Handle all exceptions'''
    logging.exception(e)
    message = str(e) or 'An unexpected error occurred.'
    return render_template('error/500.html', message=message), 500
