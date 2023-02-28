#!/bin/bash
# Name: enqueue.sh
# Purpose: Queue Consumer with a startup delay
# ----------------------------------------------
echo "$(date '+%Y-%m-%d %H:%M:%S') INFO pending: Waiting 20 secs to start queue consumer..."
time_sleep=20

while true
do
   sleep $time_sleep
   #php /app/artisan queue:consume
   php -v
   sleep $time_sleep
done
