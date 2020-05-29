IMAGE_NAME = namenode:3.2.1
CONTAINER_NAME = NameNode

all:

build: Dockerfile
	docker build --tag $(IMAGE_NAME) .

delete:
	docker rmi $(IMAGE_NAME)

interact:
	docker run --name $(CONTAINER_NAME) --rm --interactive --tty --volume $(abspath name):/opt/hadoop/dfs/name:z --volume $(abspath app-logs):/app-logs:z --publish 9000:9000 --publish 9870:9870 --publish 50070:50070 $(IMAGE_NAME)

start:
	docker run --name $(CONTAINER_NAME) --detach --volume $(abspath name):/opt/hadoop/dfs/name:z --volume $(abspath app-logs):/app-logs:z --publish 9000:9000 --publish 9870:9870 --publish 50070:50070 $(IMAGE_NAME)

insight:
	docker exec --interactive --tty $(CONTAINER_NAME) /bin/bash

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
