all: up

up: build
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down --remove-orphans

stop:
	docker compose -f ./srcs/docker-compose.yml stop

build:
	docker compose -f ./srcs/docker-compose.yml  build

clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm inception || true
	@sudo rm -rf /home/${USER}/data

re: clean up

prune: clean
	@docker system prune -a --volumes -f

.PHONY: all re up down clean prune