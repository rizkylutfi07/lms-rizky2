#!/bin/bash

# Script untuk install autostart desktop

echo "Installing LMS autostart..."

# Create autostart directory if not exists
mkdir -p ~/.config/autostart

# Copy desktop file to autostart
cp lms-autostart.desktop ~/.config/autostart/

echo ""
echo "✅ Autostart installed!"
echo ""
echo "LMS akan otomatis jalan saat login."
echo ""
echo "Untuk disable:"
echo "  rm ~/.config/autostart/lms-autostart.desktop"
echo ""
