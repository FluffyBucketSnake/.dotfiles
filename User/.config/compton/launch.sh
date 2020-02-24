#!/bin/bash

# Terminate already running compton instances
echo "Killing all compton instances..."
killall -q compton

# Wait until the processes have been shut down
echo "Waiting for all compton processes to shut down..."
while pgrep -u $UID -x compton > /dev/null; do sleep 1; done
echo "Done."

# Launch compton in the background, using the default config location
echo "Launching compton in the background..."
compton -b --config /home/fluffybucketsnake/.config/compton/compton.conf
echo "Done."
