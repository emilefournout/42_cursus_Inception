all: up

up:
	docker-compose -f ./srcs/docker-compose.yml up 

recreate:
	docker-compose -f ./srcs/docker-compose.yml up --force-recreate --build

down:
	docker-compose -f ./srcs/docker-compose.yml down
clean_volume:
	rm -rf /home/efournou/data/db/*
	rm -rf /home/efournou/data/wp/*
clean : clean_volume
	doclean
	dclean

re: clean up

r : down re
