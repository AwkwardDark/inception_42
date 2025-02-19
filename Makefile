all:
	@sudo docker compose -f srcs/docker-compose.yml up -d --build

down:
	@sudo docker compose -f srcs/docker-compose.yml down

re:
	@sudo docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@sudo docker stop $$(sudo docker ps -qa) || true
	@sudo docker rm $$(sudo docker ps -qa) || true
	@sudo docker rmi -f $$(sudo docker images -qa) || true
	@sudo docker volume rm $$(sudo docker volume ls -q) || true
	@sudo docker network rm $$(sudo docker network ls -q) || true

prune: clean
	@sudo docker system prune -a --volumes -f

.PHONY: all re down clean prune
