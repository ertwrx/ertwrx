# ERTWRX (my First Flask App)

This is a simple Flask web application. The backend is built using Flask, and the frontend is styled using CSS and animations.

## Getting Started

Follow the steps below to set up and run the app.

### 1. Clone the Repository

Clone this repository to your local machine using:

```bash
git clone https://github.com/ertwrx/ertwrx.git

cd ertwrx
```

### 2. Set up a Virtual Environment

To create a virtual environment, run the following commands:

On Linux/Mac:
```bash
python3 -m venv venv
source venv/bin/activate

On Windows:
python -m venv venv
.\venv\Scripts\activate
```

### 3. Install Dependencies
Install the necessary dependencies by running:

```bash
pip install -r requirements.txt
```

### 4. Run the Application
To run the app with Python, use the following command:


```bash
python app.py
#The app will be available at http://127.0.0.1:5000/.
```

### 5. Stopping the App
To stop the app, press Ctrl+C in the terminal.


### Troubleshooting
If you're having issues running the app, make sure the following steps are correct:

Ensure that the virtual environment is activated (source venv/bin/activate on Linux/Mac or .\venv\Scripts\activate on Windows).

Check if flask run works after setting the FLASK_APP environment variable (export FLASK_APP=app.py on Linux/Mac or set FLASK_APP=app.py on Windows).

Verify there are no port conflicts on 5000 by running lsof -i :5000 (Linux/Mac).

### License
This project is licensed under the MIT License - see the LICENSE file for details.
