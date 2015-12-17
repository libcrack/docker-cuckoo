NAME = $(shell basename `pwd | sed -e 's|docker-||g'`)
TAG = "libcrack/$(NAME)"

all: help

help:
	echo "Usage: make <build|compose|run|help>"

build:
	docker build -t $(TAG) .

run:
	docker run -d -p 8000:80 --name $(NAME) $(TAG)

compose:
	docker-compose up

.PHONY: all build compose help run
.SILENT: all build compose help run
