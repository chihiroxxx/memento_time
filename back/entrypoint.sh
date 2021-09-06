#!/bin/bash
set -e

rm -f /app/tmp/pids/unicorn.pid

bundle exec rails db:create RAILS_ENV=production
bundle exec rails db:migrate RAILS_ENV=production
bundle exec rails db:seed RAILS_ENV=production

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
