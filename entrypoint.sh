#!/usr/bin/bash

# Start VNC server
x11vnc -display :10 -noxrecord -noxfixes -noxdamage -forever -usepw -create &

# Keep the container running
tail -f /dev/null