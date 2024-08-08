from functools import wraps

from flask import session, g, redirect, url_for, current_app, abort


class LoginManager:
    """Handling login and role verifying"""

    def __init__(self, app, login_view='login'):
        self.app = app
        if app:
            self.init_app(app, login_view)
        self.user_loader_callback = None

    def init_app(self, app, login_view):
        """ init method, if login_view is not the default value "login", please init at first """
        self.app = app
        self.login_view = login_view
        app.before_request(self._load_user_from_session)
        app.login_manager = self

    def user_loader(self, callback):
        """ Decorator for method loading user by user_id"""
        self.user_loader_callback = callback
        return callback

    def login_user(self, user):
        """please invoke this method after user login

        Args:
            user (dict): user dict, must has a key "user_id"
        """
        session['user_id'] = user["user_id"]
        g.user = user

    def logout_user(self):
        """invoke this method after logout"""
        session.pop('user_id', None)
        g.user = None

    def _load_user_from_session(self):
        """Invoke before request, set global user from user_id in session"""
        user_id = session.get('user_id')
        if user_id and self.user_loader_callback:
            g.user = self.user_loader_callback(user_id)
        else:
            g.user = None


def is_logged_in():
    return 'user_id' in session


def login_required(func):
    """the decorator for the method need user login

    Args:
        func (function): the decorated method
    """

    @wraps(func)
    def decorated_view(*args, **kwargs):
        if g.user is None:
            return redirect(url_for(current_app.login_manager.login_view))
        return func(*args, **kwargs)

    return decorated_view


def roles_required(*roles):
    """the decorator for the method need verify user's role"""

    def wrapper(func):
        @wraps(func)
        @login_required
        def decorated_view(*args, **kwargs):
            if g.user['role'] in roles:
                return func(*args, **kwargs)
            abort(403, description=f'Only role(s) {roles} can access this page.')

        return decorated_view

    return wrapper
