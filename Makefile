COMPOSE = docker compose -f srcs/docker-compose.yml

start:	build
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart

build:
	$(COMPOSE) build

clean: down
	$(COMPOSE) rm

.PHONY: start stop restart build clean