#!/bin/bash

set -e

INFLUXDB_HOST=${INFLUXDB_HOST:-http://localhost:8086}
INFLUXDB_USERNAME=${INFLUXDB_USERNAME:-root}
INFLUXDB_PASSWORD=${INFLUXDB_PASSWORD:-root}
INFLUXDB_DATABASE=${INFLUXDB_DATABASE:-statsd}

#export INFLUXDB_HOST=$INFLUXDB_HOST
#export INFLUXDB_USERNAME=$INFLUXDB_USERNAME
#export INFLUXDB_PASSWORD=$INFLUXDB_PASSWORD
#export INFLUXDB_DATABASE=$INFLUXDB_DATABASE

if [ "$1" = 'telegraf' ]; then
	/app/confd -backend="env" -confdir="/app" -onetime
	#sed -i 's/INFLUXDB_HOST/$INFLUXDB_HOST' /app/statsd.conf
	#sed -i 's/INFLUXDB_USERNAME/$INFLUXDB_USERNAME' /app/statsd.conf
	#sed -i 's/INFLUXDB_PASSWORD/$INFLUXDB_PASSWORD' /app/statsd.conf
	#sed -i 's/INFLUXDB_DATABASE/$INFLUXDB_DATABASE' /app/statsd.conf
	/app/telegraf -config statsd.config
fi

exec "$@"
