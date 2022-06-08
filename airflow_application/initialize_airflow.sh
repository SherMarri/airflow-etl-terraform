#!/bin/sh
# initialize_airflow.sh

echo "Initializing airflow service..."
# explicitly set DOORSTEAD_ENV=local for migrations as a layer of defense to prevent us from accidentally running migrations against the prod database
sh -c "airflow db init &&
    (airflow scheduler &) &&
    (airflow users create \
      --username admin \
      --password 10101 \
      --firstname Peter \
      --lastname Parker \
      --role Admin \
      --email spiderman@superhero.org || 0) &&
    airflow webserver"
