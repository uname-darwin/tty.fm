#!/bin/bash

echo "🔹 Starting Tailscale daemon..."
sudo systemctl start tailscaled

echo "⏳ Waiting for Tailscale to initialize..."
sleep 2

echo "🔹 Restoring PM2 processes..."
pm2 resurrect

echo "⏳ Waiting for services to bind ports..."
sleep 2

echo "🔹 Resetting any old Funnel config..."
sudo tailscale funnel reset

echo "🔹 Exposing frontend (port 3000) to the internet..."
sudo tailscale funnel --bg 3000

echo ""
echo "✅ SERVER IS LIVE"
echo "🌍 Public URL: https://dell-inspiron.smelt-carob.ts.net"
echo ""

pm2 status
