#!/bin/bash

# Start X virtual frame buffer
Xvfb :0 -screen 0 1280x720x16 &

# Start VNC server
x11vnc -display :0 -noxrecord -noxfixes -noxdamage -forever -usepw &

# Start VS Code Server
code-server --bind-addr 0.0.0.0:8080

# Keep the container running
tail -f /dev/null