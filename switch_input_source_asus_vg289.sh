#!/bin/bash

# Define the input sources and their corresponding hexadecimal codes
SOURCE1_NAME="HDMI-1"
SOURCE1_CODE="0x11"  # Code for HDMI-1
SOURCE2_NAME="HDMI-2"
SOURCE2_CODE="0x12"  # Code for HDMI-2
SOURCE3_NAME="DISPLAYPORT-1"
SOURCE3_CODE="0x0F"  # Code for DisplayPort-1

# Get the current input source code (in hexadecimal)
CURRENT_CODE=$(ddcutil getvcp 0x60 | grep "sl=" | awk -F'sl=' '{print $2}' | awk -F')' '{print $1}')
# Function to get the code for a given source name
get_code_for_source() {
    case "$1" in
        "$SOURCE1_NAME")
            echo "$SOURCE1_CODE"
            ;;
        "$SOURCE2_NAME")
            echo "$SOURCE2_CODE"
            ;;
        "$SOURCE3_NAME")
            echo "$SOURCE3_CODE"
            ;;
        *)
            echo "Unknown source"
            ;;
    esac
}

# Determine the next input source based on the current code
switch_input_source() {
    case "$CURRENT_CODE" in
        "$SOURCE1_CODE")
            NEXT_SOURCE="$SOURCE2_NAME"
            NEXT_CODE="$SOURCE2_CODE"
            ;;
        "$SOURCE2_CODE")
            NEXT_SOURCE="$SOURCE3_NAME"
            NEXT_CODE="$SOURCE3_CODE"
            ;;
        "$SOURCE3_CODE")
            NEXT_SOURCE="$SOURCE1_NAME"
            NEXT_CODE="$SOURCE1_CODE"
            ;;
        *)
            echo "Unknown current source: $CURRENT_CODE"
            NEXT_SOURCE="$SOURCE1_NAME"
            NEXT_CODE="$SOURCE1_CODE"
            ;;
    esac

    echo "Switching input source to $NEXT_SOURCE"
    ddcutil setvcp 0x60 $NEXT_CODE
}

# Call the function to switch input sources
switch_input_source
