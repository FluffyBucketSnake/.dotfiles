#!/bin/bash

# Terminate all already running bar instances
echo "Killing all running Polybar instances..."
killall -q polybar

# Wait until the processes have been shut down
echo "Waiting for all instances to close."
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
echo "Done."

# Launch Polybar
echo "Launching Polybar..."
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload default &
  done
else
  polybar --reload default &
fi
echo "Done."
