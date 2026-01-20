#!/bin/bash

# Add event to subscribe
sketchybar --add event aerospace_workspace_change

# Define your spaces with names and corresponding Nerd Font icons
# "home:"
# SPACES=("1:" "2:󰖟" "3:󰍩" "4:󰎆")
SPACES=("1:" "2:" "3:" "4:" "5:")

# Add and configure spaces
for SPACE in "${SPACES[@]}"; do
  WORKSPACE_NAME=${SPACE%%:*} # Extract name (everything before ':')
  ICON=${SPACE##*:}           # Extract icon (everything after ':')

  # Add and set space
  sketchybar --add item "workspace.$WORKSPACE_NAME" left \
    --subscribe "workspace.$WORKSPACE_NAME" aerospace_workspace_change \
    --set "workspace.$WORKSPACE_NAME" \
    label="$WORKSPACE_NAME" \
	label.y_offset=-1 \
	label.padding_left=10 \
	icon.drawing=0 \
	icon="$ICON" \
	icon.padding_right=5 \
    click_script="aerospace workspace $WORKSPACE_NAME" \
    script="$PLUGIN_DIR/aerospace.sh $WORKSPACE_NAME"
done
