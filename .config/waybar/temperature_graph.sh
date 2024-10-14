#!/bin/sh

# Set temperature module output to a variable
TEMP_OUTPUT=$(waybar --no-daemon --quiet --module temperature)

# Extract the current temperature value
TEMP_VALUE=$(echo "$TEMP_OUTPUT" | awk '{print $1}')

# Generate the graph using your chosen tool (e.g., gsynclast or asciigraph)
# For gsynclast:
gsynclast -x 10 -y 10 -w 50 -h 10 -l $TEMP_VALUE -t "°C"

# For asciigraph:
asciigraph -g -w 50 -h 10 --title "Temperature (°C)" --xlabel "Time" --ylabel "Temperature" $TEMP_VALUE
