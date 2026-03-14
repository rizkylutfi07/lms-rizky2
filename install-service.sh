#!/bin/bash

# Script untuk install systemd service LMS

echo "Installing LMS systemd service..."

# Copy service file
sudo cp lms.service /etc/systemd/system/

# Reload systemd
sudo systemctl daemon-reload

# Enable service (auto-start on boot)
sudo systemctl enable lms.service

# Start service now
sudo systemctl start lms.service

echo ""
echo "✅ Service installed successfully!"
echo ""
echo "Perintah berguna:"
echo "  sudo systemctl status lms     # Cek status"
echo "  sudo systemctl stop lms       # Stop service"
echo "  sudo systemctl restart lms    # Restart service"
echo "  sudo systemctl disable lms    # Disable auto-start"
echo "  journalctl -u lms -f          # Lihat log real-time"
echo ""
