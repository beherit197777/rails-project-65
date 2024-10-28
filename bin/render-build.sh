#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Install JavaScript dependencies
yarn install

# Build JavaScript assets
yarn build

# Run database migrations and seed
bundle exec rails db:migrate
bundle exec rails db:seed

# Precompile and clean assets
bundle exec rails assets:precompile
bundle exec rails assets:clean

