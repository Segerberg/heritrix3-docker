#!/bin/bash


: ${USER:=admin}
: ${PASSWORD:=admin}

# And fire it up:
/opt/heritrix/bin/heritrix -a admin:admin -b 0.0.0.0 -j /mnt/heritrix-data/jobs

