#!/bin/bash
# Ref: https://stackoverflow.com/questions/37836764/run-command-in-docker-container-only-on-the-first-start

CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    apt-get -y install debmatic &
else
    echo "-- Not first container startup --"
fi

exec /lib/systemd/systemd
