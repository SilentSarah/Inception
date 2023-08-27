CONTAINERS = nginx mariadb wordpress redis vsftpd adminer
up:
	docker-compose -f requirements/docker-compose.yml up

down:
	docker-compose down

clean:
	docker system prune -a

fclean:
	docker rmi $(docker images -qa)
	docker rm $(CONTAINERS)
	docker network rm -f $(docker network ls -q)
	