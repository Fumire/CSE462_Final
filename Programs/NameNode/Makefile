IMAGE_NAME = namenode:3.2.1
CONTAINER_NAME = NameNode3.2.1

all:

build: Dockerfile
	docker build --tag $(IMAGE_NAME) .

delete:
	docker rmi $(IMAGE_NAME)

interact:
	docker run --name $(CONTAINER_NAME) --rm --interactive --tty --volume $(abspath .):/opt/hadoop/dfs/name --publish-all $(IMAGE_NAME)
