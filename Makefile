NAME = alpine-ssh
VERSION = 0.1.0

.PHONY: all build

all: build run

build:
	        podman build -t $(NAME) --rm .

runtest:
	        podman run -p 9022:22 -v /var/podman/alpine-ssh/home:/home/remoteuser -v /var/docker/alpine-ssh/etc:/etc/ssh --name $(NAME) $(NAME); 

run:
	        podman run -d --restart unless-stopped -p 9022:22 -v /var/podman/alpine-ssh/home:/home/remoteuser -v /var/podman/alpine-ssh/etc:/etc/ssh --name $(NAME) $(NAME); 

entry:
	        podman run --interactive --tty --rm --entrypoint=/bin/sh --name "$(NAME)" $(NAME);

shell:
	        podman exec -it $(NAME) /bin/sh

stop:
	        podman stop $(NAME) && docker rm $(NAME)

last_built_date:
	        podman inspect -f '{{ .Created }}' $(NAME)
