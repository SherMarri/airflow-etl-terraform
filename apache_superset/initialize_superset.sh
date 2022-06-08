#!/bin/sh
# initialize_superset.sh

echo "Initializing Apache Superset..."

echo "Upgrading database..."
superset db upgrade

echo "Creating admin..."
superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin

# Load some data to play with
echo "Loading examples..."
superset load_examples

# Create default roles and permissions
echo "Initializing roles and permissions..."
superset init

echo "Initializing server..."
superset run -p 8088 --host=0.0.0.0
