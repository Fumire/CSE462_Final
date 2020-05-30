IMAGE_NAME = datanode:3.2.1
CONTAINER_NAME = DataNode

all:

build: Dockerfile
	docker build --tag $(IMAGE_NAME) .

delete:
	docker rmi $(IMAGE_NAME)

interact:
	docker run --name $(CONTAINER_NAME) --rm --interactive --tty --volume $(abspath name):/opt/hadoop/dfs/name:z --volume $(abspath ../Scripts):/Scripts:z --publish 8030:8030 --publish 8031:8031 --publish 8032:8032 --publish 8033:8033 --publish 8042:8042 --publish 9866:9866 --publish 9864:9864 --publish 50010:50010 --publish 50075:50075 $(IMAGE_NAME)

start:
	docker run --name $(CONTAINER_NAME) --detach --volume $(abspath name):/opt/hadoop/dfs/name:z --volume $(abspath ../Scripts):/Scripts:z --publish 8030:8030 --publish 8031:8031 --publish 8032:8032 --publish 8033:8033 --publish 8042:8042 --publish 9866:9866 --publish 9864:9864 --publish 50010:50010 --publish 50075:50075 $(IMAGE_NAME)

insight:
	docker exec --interactive --tty $(CONTAINER_NAME) /bin/bash

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
