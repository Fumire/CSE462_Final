IMAGE_NAME = namenode:2.9.2
CONTAINER_NAME = NameNode

PORT_OPTS = --publish 9000:9000 --publish 19888:19888 --publish 10033:10033 --publish 50070:50070 --publish 8088:8088 --publish 8030:8030 --publish 8031:8031 --publish 8032:8032 --publish 8033:8033 --publish 10020:10020
VOLUME_OPTS = --volume $(abspath name):/opt/hadoop/dfs/name:z --volume $(abspath ../Scripts):/Scripts:z
HOST_OPTS = --add-host elec-com-eng-p28:114.70.14.161 --add-host elec-com-eng-p29:114.70.14.162 --add-host elec-com-eng-p30:114.70.14.163
CPU_OPTS = --cpus="3"
MEM_OPTS = --memory="6g"
OPTS = $(PORT_OPTS) $(VOLUME_OPTS) $(HOST_OPTS) $(CPU_OPTS) $(MEM_OPTS)

all:

build: Dockerfile
	docker build --tag $(IMAGE_NAME) .

delete:
	docker rmi $(IMAGE_NAME)

interact:
	rm -rfv name
	docker run --hostname $$HOSTNAME --name $(CONTAINER_NAME) --rm --interactive --tty $(OPTS) $(IMAGE_NAME)

start:
	rm -rfv name
	docker run --hostname $$HOSTNAME --name $(CONTAINER_NAME) --detach $(OPTS) $(IMAGE_NAME)

insight:
	docker exec --interactive --tty $(CONTAINER_NAME) /bin/bash

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
