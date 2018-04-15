AUTHOR=piDockAble
NAME=raspberry-pi3
TAG=pidak
VERSION=0

.PHONY: all build bash run help
all: build

build:
	docker image build -t $(TAG) .

bash:
	docker exec -ti $(TAG)-0 /bin/bash

run:
	docker run -it --rm --name $(TAG)-0 -h $(TAG)-0 -d $(TAG)

help:
	@docker inspect $(TAG) | grep -i running | head -1

test:
	open http://$(DOCKERHOST):8080/gameoflife/
