from flask import Blueprint, render_template, current_app
import os

main = Blueprint('main', __name__)

@main.route('/')
def index():
    try:
        template_path = os.path.join(current_app.template_folder, 'index.html')
        print(f"Looking for template at: {template_path}")
        print(f"Template exists: {os.path.exists(template_path)}")
        return render_template('index.html')
    except Exception as e:
        print(f"Error rendering template: {str(e)}")
        return f"Error rendering template: {str(e)}", 500
