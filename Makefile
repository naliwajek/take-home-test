build:
	docker-compose build

test: down build
	./bin/test.sh

down:
	docker-compose down

bash: down build
	docker-compose run --rm app bash

console: down build
	docker-compose run --rm app bundle console

results: down build
	docker-compose run --rm app ruby script.rb