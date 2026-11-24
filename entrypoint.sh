#!/bin/bash
set -e

airflow db migrate

airflow api-server --port 8080 &
airflow scheduler &
airflow dag-processor &
airflow triggerer &

trap 'kill $(jobs -p) 2>/dev/null' TERM INT
wait -n
exit $?
