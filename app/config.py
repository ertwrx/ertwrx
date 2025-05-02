import os

class Config:
    SECRET_KEY = os.environ.get("SECRET_KEY", "dev")
    DEBUG = os.environ.get("DEBUG", "true").lower() in ("true", "1")
