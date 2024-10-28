#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install

yarn build
yarn build:css

bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed

# Проверка прав доступа к файлам
chmod -R 755 public/assets



