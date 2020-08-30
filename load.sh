#!/bin/sh

# Start mongod
mongod --bind_ip 0.0.0.0 &

# Wait for pid 
until pids=$(pidof mongod)
do   
    sleep 1
done

# Import the data
mongoimport --db=test --type=csv --headerline --file=aliases.csv

# Let the container run indefinitely
mkfifo /tmp/mypipe

while read SIGNAL; do
    case "$SIGNAL" in
        *EXIT*)break;;
        *)echo "signal  $SIGNAL  is unsupported" >/dev/stderr;;
    esac
done < /tmp/mypipe