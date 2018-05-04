#!/bin/bash

SECONDARY_DISPLAY="VGA-1"
INTERNAL_DISPLAY="LVDS-1"
MAIN_DISPLAY="DP-3"

# 0 means 'connected' and 1 means 'disconnected'

# Here we get status of primary display
xrandr | grep $MAIN_DISPLAY | grep " connected"
if [ $? -eq 0 ]; then
	MAIN_DISPLAY_STATUS=0
else
	MAIN_DISPLAY_STATUS=1
fi

# Here we get status of secondary display
xrandr | grep $SECONDARY_DISPLAY | grep " connected"
if [ $? -eq 0 ]; then
	SECONDARY_DISPLAY_STATUS=0
else
	SECONDARY_DISPLAY_STATUS=1
fi


# Now the magick begins
if [ $MAIN_DISPLAY_STATUS -eq 0 ] && [ $SECONDARY_DISPLAY_STATUS -eq 0 ]; then
	xrandr --output $INTERNAL_DISPLAY --off --output $MAIN_DISPLAY --auto --primary --output $SECONDARY_DISPLAY --auto --right-of $MAIN_DISPLAY
elif [ $MAIN_DISPLAY_STATUS -eq 0 ] && [ $SECONDARY_DISPLAY_STATUS -eq 1 ]; then
	xrandr --output $INTERNAL_DISPLAY --off --output $MAIN_DISPLAY --auto --primary
else
	xrandr --output $INTERNAL_DISPLAY --auto
fi
