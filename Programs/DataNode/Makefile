IMAGE_NAME = datanode:3.2.1
CONTAINER_NAME = DataNode

all:

build: Dockerfile
	docker build --tag $(IMAGE_NAME) .

delete:
	docker rmi $(IMAGE_NAME)

interact:
	docker run --name $(CONTAINER_NAME) --rm --interactive --tty --volume $(abspath name):/opt/hadoop/dfs/name:z --publish 50010:50010 --publish 50075:50075 $(IMAGE_NAME)

start:
	docker run --name $(CONTAINER_NAME) --detach --volume $(abspath name):/opt/hadoop/dfs/name:z --publish 50010:50010 --publish 50075:50075 $(IMAGE_NAME)

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
