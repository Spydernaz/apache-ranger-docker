#!/bin/sh

cd $RANGER_HOME

echo $RANGER_HOME


sleep 30

$RANGER_HOME/setup.sh
ranger-admin start

# Keep the container running
tail -f /dev/null

