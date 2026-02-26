all:
	@mkdir -p /home/$(USER)/data/mariadb-data
	@mkdir -p /home/$(USER)/data/wordpress-data
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean: clean
	docker system prune -af
	sudo rm -rf /home/$(USER)/data

re: fclean all

.PHONY: all clean fclean re
