import mysql.connector
from flask import current_app as app
from mysql.connector import Error

from yob import connect

# Create a database connection pool
db_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="mypool",
    pool_size=5,
    pool_reset_session=True,
    user=connect.dbuser,
    password=connect.dbpass,
    host=connect.dbhost,
    database=connect.dbname,
    auth_plugin='mysql_native_password',
    autocommit=True
)


def get_connection():
    """Get a connection from the pool and enable autocommit"""
    try:
        connection = db_pool.get_connection()
        if connection.is_connected():
            # connection.autocommit = True  # Enable autocommit
            return connection
        else:
            raise Error("Failed to connect to the database.")
    except Error as e:
        app.logger.error(f"Error getting connection from pool: {e}")
        raise


def get_cursor():
    """Gets a new dictionary cursor for the database.

    If necessary, a new database connection be created here and used for all
    subsequent to getCursor()."""
    try:
        connection = get_connection()
        cursor = connection.cursor(dictionary=True)
        return cursor
    except Error as e:
        app.logger.error(f"Error getting cursor: {e}")
        connection.close()
        raise


class Cursor:
    """Context Manager of Cursor"""

    def __init__(self, **cursor_params):
        self.connection = None
        self.cursor = None
        # Set default cursor parameters with dictionary=True
        self.cursor_params = {'dictionary': True}
        # Update with any additional provided parameters
        self.cursor_params.update(cursor_params)

    def __enter__(self):
        try:
            self.connection = get_connection()
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
            try:
                self.cursor.close()
            except Error as e:
                app.logger.error(f"Error closing cursor: {e}")
            self.cursor = None
        if self.connection:
            try:
                self.connection.close()  # Return the connection to the pool
            except Error as e:
                app.logger.error(f"Error closing connection: {e}")
            self.connection = None
