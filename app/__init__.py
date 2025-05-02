from flask import Flask
from .routes import main
from .config import Config
import os

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)
    
    # Explicitly set the template folder path
    template_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'templates')
    app.template_folder = template_dir
    
    app.register_blueprint(main)
    
    # Add some debug info if in debug mode
    if app.debug:
        @app.route('/debug')
        def debug_info():
            return {
                "template_folder": app.template_folder,
                "static_folder": app.static_folder,
                "debug": app.debug,
                "env": app.env
            }
    
    return app
