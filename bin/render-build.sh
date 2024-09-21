#!/usr/bin/env bash
# exit on error
set -o errexit

# Установка конфигурации Bundle
bundle config set --local without development

# Установка зависимостей
bundle install && yarn install && yarn build:css && yarn build && rake assets:precompile

bundle exec rake  assets:clean
# # Установка Yarn зависимостей (если используется)
# if [ -f yarn.lock ]; then
#   yarn install
# fi


bundle exec rake  db:migrate

# Заполнение базы данных начальными данными
bundle exec rake db:seed

# # Компиляция ассетов
# bundle exec rake  assets:precompile

# # Очистка ассетов (убедитесь, что такая задача существует)
