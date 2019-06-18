NAME = ubi7-ssh
VERSION = 0.1.0

.PHONY: all build

all: build run

build:
	        docker build -t $(NAME) --rm .

run:
	        docker run -d -p 8280:80 --name $(NAME) $(NAME); 

entry:
	        docker run --interactive --tty --rm --entrypoint=/bin/sh --name "$(NAME)" $(NAME);

shell:
	        docker exec -it $(NAME) /bin/sh

stop:
	        docker stop $(NAME)

last_built_date:
	        docker inspect -f '{{ .Created }}' $(NAME)
