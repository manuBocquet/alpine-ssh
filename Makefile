NAME = alpine-ssh
VERSION = 0.1.0

.PHONY: all build

all: build run

build:
	        docker build -t $(NAME) --rm .

runtest:
	        docker run -p 9022:22 -v /mnt/docker/alpine-ssh/home:/home/remoteuser -v /mnt/docker/alpine-ssh/etc:/etc/ssh --name $(NAME) $(NAME); 

run:
	        docker run -d --restart unless-stopped -p 9022:22 -v /mnt/docker/alpine-ssh/home:/home/remoteuser -v /mnt/docker/alpine-ssh/etc:/etc/ssh --name $(NAME) $(NAME); 

entry:
	        docker run --interactive --tty --rm --entrypoint=/bin/sh --name "$(NAME)" $(NAME);

shell:
	        docker exec -it $(NAME) /bin/sh

stop:
	        docker stop $(NAME)

last_built_date:
	        docker inspect -f '{{ .Created }}' $(NAME)
