BACKEND_ROOT=backend
COMPOSE=docker compose

DOCKER_MANAGE=$(COMPOSE) exec web python manage.py

run:
	$(COMPOSE) up

migrate:
	$(DOCKER_MANAGE) migrate

makemigrations:
	$(DOCKER_MANAGE) makemigrations

static:
	$(DOCKER_MANAGE) collectstatic --noinput

requirements:
	$(COMPOSE) exec web pip freeze > $(BACKEND_ROOT)/requirements.txt

install:
	$(COMPOSE) build web

gunicorn:
	$(COMPOSE) exec web gunicorn config.wsgi:application --bind 0.0.0.0:8000

restart:
	$(COMPOSE) restart

deploy:
	git pull
	$(COMPOSE) up -d --build
	$(DOCKER_MANAGE) migrate
	$(DOCKER_MANAGE) collectstatic --noinput

check:
	$(DOCKER_MANAGE) check

shell:
	$(DOCKER_MANAGE) shell

logs:
	$(COMPOSE) logs -f web

db-logs:
	$(COMPOSE) logs -f db

backup-db:
	mkdir -p $(BACKEND_ROOT)/backups
	$(COMPOSE) exec -T db sh -c 'pg_dump -U "$$POSTGRES_USER" "$$POSTGRES_DB"' > $(BACKEND_ROOT)/backups/crabgator_$$(date +%Y%m%d_%H%M%S).sql
