setup: install

install:
	bundle install
	yarn install
	yarn build
	bundle exec rails db:create db:migrate assets:precompile

test:
	bundle exec rake test

lint:
	bundle exec rubocop

init-env:
	touch .env

.PHONY: test