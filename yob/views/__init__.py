import os
import pkgutil

# Get the path of the current directory
current_dir = os.path.dirname(__file__)

# Iterate over all files in the current directory and import all .py files (excluding __init__.py)
for _, module_name, _ in pkgutil.iter_modules([current_dir]):
    if module_name != '__init__':
        # Use relative import to import the module
        __import__(f'{__package__}.{module_name}', fromlist=[module_name])
