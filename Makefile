NAME = $(shell basename `pwd | sed -e 's|docker-||g'`)
TAG = $(shell date +%m%d)
IMG = libcrack/$(NAME)
PORT = 8000


help:
	echo "Usage: make <build|compose|run|help>"

build:
	docker build --tag=$(IMG):$(TAG) .

run:
	docker run -d -p $(PORT):80 --name $(NAME) $(TAG)

compose:
	docker-compose up

.PHONY: help build run compose
.SILENT: help
