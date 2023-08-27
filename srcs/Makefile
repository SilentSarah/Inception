CONTAINERS = nginx mariadb wordpress redis vsftpd adminer snake-game
VOLUMES = $(addprefix /home/hmeftah/Data/, WP DB BONUS Adminer Snake)

up: $(VOLUMES)
	@docker-compose -f requirements/docker-compose.yml up -d mariadb
	@docker-compose -f requirements/docker-compose.yml up -d redis
	@docker-compose -f requirements/docker-compose.yml up -d wordpress
	@docker-compose -f requirements/docker-compose.yml up -d adminer
	@docker-compose -f requirements/docker-compose.yml up -d snake-game
	@docker-compose -f requirements/docker-compose.yml up -d vsftpd
	@docker-compose -f requirements/docker-compose.yml up -d nginx

$(VOLUMES):
	@su -c "mkdir $(VOLUMES) hmeftah"

down:
	@docker-compose -f requirements/docker-compose.yml down

build:
	@docker-compose -f requirements/docker-compose.yml build 

fclean:
	@rm -rf $(VOLUMES)
	@docker system prune -a -f
	
re: clean up
