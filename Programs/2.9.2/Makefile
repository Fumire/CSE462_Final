IMAGE_NAME = base:2.9.2
CONTAINER_NAME = Base2.9.2

all:

build: Dockerfile
	docker build --tag $(IMAGE_NAME) .

delete:
	docker rmi $(IMAGE_NAME)

interact:
	docker run --name $(CONTAINER_NAME) --rm --interactive --tty $(IMAGE_NAME)
