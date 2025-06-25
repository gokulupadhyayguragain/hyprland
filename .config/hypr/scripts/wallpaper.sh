#!/bin/bash

# Define wallpaper directory (no trailing slash)
WALLPAPER_DIR="$HOME/WALLPAPERS"

# Find all image files (case-insensitive), pick one at random
IMG=$(find "$WALLPAPER_DIR" -type f -iregex '.*\.\(jpg\|jpeg\|png\)' | shuf -n 1)

# Exit if no image was found
[ -z "$IMG" ] && echo "No wallpaper found in $WALLPAPER_DIR" && exit 1

# Generate random X,Y coordinates (0.00–0.99) for grow transition
X=$(printf "0.%02d" $((RANDOM % 100)))
Y=$(printf "0.%02d" $((RANDOM % 100)))

# Apply wallpaper with circular animation from random point
swww img "$IMG" --transition-type grow --transition-pos "$X,$Y" --transition-duration 1
