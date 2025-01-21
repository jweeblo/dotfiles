#!/bin/bash

# File to track Redshift state
REDSHIFT_STATE_FILE="/tmp/redshift_state"

# Check the current state
if [[ -f "$REDSHIFT_STATE_FILE" ]]; then
    # Redshift is enabled, so disable it
    redshift -x
    rm "$REDSHIFT_STATE_FILE"
else
    # Redshift is disabled, so enable it
    redshift -O 3000 &
    touch "$REDSHIFT_STATE_FILE"
fi


