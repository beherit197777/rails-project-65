#!/usr/bin/env bash
# exit on error
set -o errexit

rm -rf node_modules
rm -rf tmp/cache
rm -rf public/assets

bundle install
yarn install --frozen-lockfile

npm install -g esbuild

yarn build
yarn build:css

bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed

# Проверка прав доступа к файлам
chmod -R 755 public/assets



