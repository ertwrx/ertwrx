# 🚀 ERTWRX Flask App

[![CI/CD](https://img.shields.io/github/actions/workflow/status/ertwrx/ertwrx/CI_CD_Pipeline.yml?branch=master)](https://github.com/ertwrx/ertwrx/actions/workflows/CI_CD_Pipeline.yml)
[![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-3.x-lightgrey.svg)](https://flask.palletsprojects.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Last Commit](https://img.shields.io/github/last-commit/ertwrx/ertwrx.svg)](https://github.com/ertwrx/ertwrx/commits/master)
[![Lines of Code](https://img.shields.io/tokei/lines/github/ertwrx/ertwrx)](https://github.com/ertwrx/ertwrx)


## ✨ Overview

This project is a personal learning example of a simple Flask web app. It shows how to structure a Flask application using an application factory, Blueprints, and environment-based configuration. The homepage displays a stylized **"ERTWRX"** text with a red/gold theme and an animated glowing effect, along with a **Start** button that links to a YouTube video. It is designed to be easy to read and modify for learning purposes.

-   ✨ **Key features:** Stylized homepage using CSS animations, modular Flask app with Blueprints, environment config via python-dotenv, and a debug route for development.
    
-   📘 **Purpose:** Learn Flask basics and understand how the pieces (app factory, config, templates) fit together.
    

## 🛠️ Technology Stack

-   🐍 **Python 3.x** – The code runs on Python 3.10 or newer.
    
-   ⚙️ **Flask (v3.x)** – Web framework used for routing and rendering templates.
    
-   🖌️ **Jinja2** – Templating engine (used in HTML templates).
    
-   📝 **python-dotenv** – Loads environment variables from a `.flaskenv` or `.env` file.
    
-   🧰 **GitHub Actions** – For Continuous Integration (optional; see `.github/workflows`).
    
-   🚀 **Gunicorn, Nginx, Supervisor** – Included example configs for deploying to a server (not required for local dev).
    

## 📁 Project Structure

```
ertwrx/                  # Project root directory
├── app/                 # Application package
│   ├── __init__.py      # App factory and initialization
│   ├── config.py        # Config class (loads SECRET_KEY, DEBUG)
│   ├── routes.py        # Blueprint with routes for the web app
│   └── templates/       # HTML templates
│       └── index.html   # Main page template
├── run.py               # Entry point for running locally (uses Flask CLI)
├── wsgi.py              # Entry point for WSGI servers (e.g., Gunicorn)
├── requirements.txt     # Python dependencies
├── .flaskenv            # Environment settings for Flask (app, debug, host, port)
├── setup-server.sh      # Script to prepare server (install dependencies, etc.)
├── nginx/               # Example Nginx config for production
│   └── ertwrx.conf
└── supervisor/          # Example Supervisor config for production
    └── ertwrx-app.conf

```

## ⚙️ Setup & Installation

Follow these steps to run the app on your local machine:

1.  **Clone the repo** and navigate into it:
    
    ```bash
    git clone https://github.com/ertwrx/ertwrx.git
    cd ertwrx
    
    ```
    
2.  **Create a virtual environment** (recommended) and activate it:
    
    ```bash
    python3 -m venv venv
    source venv/bin/activate    # On Windows use: venv\Scripts\activate
    
    ```
    
3.  **Install dependencies**:
    
    ```bash
    pip install -r requirements.txt
    
    ```
    
4.  **(Optional) Configure environment**:
    
    -   Rename or edit `.flaskenv` (or create a `.env` file) to set `SECRET_KEY`, `DEBUG`, etc. The provided `.flaskenv` already sets `FLASK_APP=run.py`, `FLASK_DEBUG=1`, `FLASK_RUN_HOST=0.0.0.0`, and `FLASK_RUN_PORT=5000`.
        
    -   You can customize `SECRET_KEY` or other settings in `app/config.py` if needed.
        
5.  **Run the app**:
    
    -   Using Flask CLI (thanks to `.flaskenv`):
        
        ```bash
        flask run
        
        ```
        
    -   Or by running the script directly:
        
        ```bash
        python run.py
        
        ```
        
    
    The app will start on [http://localhost:5000](http://localhost:5000/) by default.
    

## 🎯 Usage

-   Open your browser and go to [http://localhost:5000](http://localhost:5000/). You should see the **"ERTWRX"** text with a glowing animation and a red/gold **Start** button.
    
-   Clicking **Start** will open the specified YouTube video in a new tab.
    
-   If `DEBUG` is enabled (default in `.flaskenv`), you can visit [http://localhost:5000/debug](http://localhost:5000/debug) to see basic debug info (like template folder, debug mode, etc.).
    
-   Feel free to inspect and modify the `app/routes.py` and `app/templates/index.html` files to change the content or style.
    

## 💡 How It Works

-   **Application Factory:** `app/__init__.py` contains `create_app()`, which creates the Flask app, loads the configuration from `Config`, and registers the `main` Blueprint from `routes.py`.
    
-   **Blueprint:** In `app/routes.py`, a Blueprint named `main` defines the `/` route. This route renders `index.html` from the `templates` folder. The route also logs template path and existence for debugging.
    
-   **Configuration:** `app/config.py` defines a `Config` class that reads `SECRET_KEY` and `DEBUG` from environment variables (using defaults if not set). The `Config` is applied with `app.config.from_object()`.
    
-   **Templates & Styling:** The `index.html` file uses custom CSS for styling (black background, red text, glowing animation). It includes a Google font (Papyrus) and keyframe animations to create a pulsating glow effect. A CSS-styled button links to the YouTube video.
    
-   **WSGI & Deployment:** For production, `wsgi.py` exposes the Flask app for WSGI servers like Gunicorn. Example configurations for Gunicorn (via Supervisor) and Nginx are provided in `/supervisor` and `/nginx`, but these are not required for local development.
    

## 📜 License

