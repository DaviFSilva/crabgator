BACKEND_ROOT=backend

VENV=$(BACKEND_ROOT)/.venv
PYTHON=$(VENV)/bin/python
PIP=$(VENV)/bin/pip
GUNICORN=$(VENV)/bin/gunicorn
MANAGE=$(PYTHON) $(BACKEND_ROOT)/manage.py

run:
	$(MANAGE) runserver 0.0.0.0:8000

migrate:
	$(MANAGE) migrate

makemigrations:
	$(MANAGE) makemigrations

static:
	$(MANAGE) collectstatic --noinput

requirements:
	$(PIP) freeze > $(BACKEND_ROOT)/requirements.txt

install:
	$(PIP) install -r $(BACKEND_ROOT)/requirements.txt

gunicorn:
	cd $(BACKEND_ROOT) && $(GUNICORN) config.wsgi:application --bind 127.0.0.1:8000

restart:
	sudo systemctl restart gunicorn
	sudo systemctl restart nginx

deploy:
	git pull
	$(PIP) install -r $(BACKEND_ROOT)/requirements.txt
	$(MANAGE) collectstatic --noinput
	docker compose down
	docker compose up -d --build	
	docker compose exec web python manage.py migrate

check:
	$(MANAGE) check

shell:
	$(MANAGE) shell
