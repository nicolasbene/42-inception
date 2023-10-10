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

COMPOSE = docker compose -f srcs/docker-compose.yml --env-file srcs/.env

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
	docker volume rm mariadb
	docker volume rm wordpress

re: clean start

.PHONY: start stop restart build clean
