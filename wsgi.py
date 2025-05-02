from app import create_app
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Create the Flask application
application = create_app()
app = application  # For compatibility with both gunicorn and Flask CLI
