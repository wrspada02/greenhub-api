#!/bin/bash
set -e

# Run migrations
echo "Running migrations..."
bundle exec rails db:migrate

# Start the Rails server
echo "Starting Rails server..."
exec "$@"
