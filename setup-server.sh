#!/bin/bash
# Setup script for ERTWRX application deployment
# Run this on your staging and production servers

# Install required packages
sudo apt-get update
sudo apt-get install -y python3 python3-pip python3-venv nginx supervisor

# Create application directory structure
sudo mkdir -p /opt/ertwrx/app-current
sudo mkdir -p /var/log/ertwrx

# Create a virtual environment
sudo python3 -m venv /opt/ertwrx/venv

# Create user for the application
sudo useradd -m -r ertwrx || true

# Set permissions
sudo chown -R ertwrx:ertwrx /opt/ertwrx
sudo chown -R ertwrx:ertwrx /var/log/ertwrx

# Configure supervisor
sudo cp supervisor/ertwrx-app.conf /etc/supervisor/conf.d/
sudo sed -i 's|/path/to/app-current|/opt/ertwrx/app-current|g' /etc/supervisor/conf.d/ertwrx-app.conf
sudo sed -i 's|/path/to/venv|/opt/ertwrx/venv|g' /etc/supervisor/conf.d/ertwrx-app.conf

# Configure nginx
sudo cp nginx/ertwrx.conf /etc/nginx/sites-available/
sudo sed -i 's|/path/to/app-current|/opt/ertwrx/app-current|g' /etc/nginx/sites-available/ertwrx.conf
sudo ln -sf /etc/nginx/sites-available/ertwrx.conf /etc/nginx/sites-enabled/

# Create .env file template
cat > /opt/ertwrx/.env.template << EOF
SECRET_KEY=your_production_secret_key_here
DEBUG=false
EOF

# Reload services
sudo supervisorctl reread
sudo supervisorctl update
sudo systemctl reload nginx

echo "Server setup completed!"
echo "Remember to:"
echo "1. Set up proper SSL certificates"
echo "2. Configure firewall rules"
echo "3. Set up proper secrets in GitHub repository"
