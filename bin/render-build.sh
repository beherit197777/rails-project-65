#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install
npm install -g esbuild
yarn build
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed



