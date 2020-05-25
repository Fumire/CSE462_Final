IMAGE_NAME = base:3.2.1
CONTAINER_NAME = Base3.2.1

all:

build: Dockerfile
	docker build --tag $(IMAGE_NAME) .

delete:
	docker rmi $(IMAGE_NAME)

interact:
	docker run --name $(CONTAINER_NAME) --rm --iteractive --tty $(IMAGE_NAME)
