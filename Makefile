# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nibenoit <nibenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/10 15:33:45 by nibenoit          #+#    #+#              #
#    Updated: 2023/10/10 15:33:49 by nibenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ENV_FILE = srcs/.env
COMPOSE_FILE = srcs/docker-compose.yml
COMPOSE = docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE)


all: build upd

dir:
	mkdir -p "$(HOME)/data/mariadb"
	mkdir -p "$(HOME)/data/mariadb"

upd:	dir $(ENV_FILE)
	$(COMPOSE) up -d

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

build:
	$(COMPOSE) build

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs

logs.%:
	$(COMPOSE) logs $*

clean:
	$(COMPOSE) down -v

fclean: clean
	docker system prune -a --volumes -f
	sudo rm -rf "$(HOME)/data"

re: clean all

.PHONY: all dir upd start stop down build clean fclean ps re logs
