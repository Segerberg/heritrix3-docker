#!/bin/sh

# Set up variables, using defaults if unset:
: ${HERITRIX_USER:=heritrix}
: ${HERITRIX_PASSWORD:=heritrix}

# And fire it up:
./opt/heritrix/bin/heritrix -a $HERITRIX_USER:$HERITRIX_PASSWORD -b 0.0.0.0 -j /jobs
