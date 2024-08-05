import mysql.connector
from mysql.connector import Error
from yob import connect
from flask import current_app as app

db_connection = None

def get_connection():
    global db_connection

    if db_connection is None or not db_connection.is_connected():
        db_connection = mysql.connector.connect(user=connect.dbuser,
                                                password=connect.dbpass,
                                                host=connect.dbhost,
                                                auth_plugin='mysql_native_password',
                                                database=connect.dbname,
                                                autocommit=True)

    return db_connection

def get_cursor():
    """Gets a new dictionary cursor for the database.

    If necessary, a new database connection be created here and used for all
    subsequent to getCursor()."""
    cursor = get_connection().cursor(dictionary=True)

    return cursor


class Cursor:
    """Context Manager of Cursor"""
    def __init__(self, **cursor_params):
        self.connection = get_connection()
        self.cursor = None
        self.cursor_params = cursor_params

    def __enter__(self):
        try:
            if self.connection.is_connected():
                self.cursor = self.connection.cursor(**self.cursor_params)
            else:
                raise Error("Connection is not available.")
        except Error as e:
            app.logger.error(f"Error in Cursor __enter__: {e}")
            raise
        return self.cursor

    def __exit__(self, exc_type, exc_val, exc_tb):
        if self.cursor:
            self.cursor.close()
            self.cursor = None
