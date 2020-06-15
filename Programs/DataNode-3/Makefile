IMAGE_NAME = datanode:3.2.1
CONTAINER_NAME = DataNode

PORT_OPTS = --network host#--publish 22:22 --publish 8030:8030 --publish 8031:8031 --publish 8032:8032 --publish 8033:8033 --publish 8042:8042 --publish 9866:9866 --publish 9867:9867 --publish 9864:9864 --publish 41335:41335 --publish 50010:50010 --publish 50075:50075
VOLUME_OPTS = --volume $(abspath name):/opt/hadoop/dfs/name:z --volume $(abspath ../Scripts):/Scripts:z
HOST_OPTS = --add-host elec-com-eng-p28:114.70.14.161 --add-host elec-com-eng-p29:114.70.14.162 --add-host elec-com-eng-p30:114.70.14.163
CPU_OPTS = --cpus="1"
MEM_OPTS = --memory="2g"
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
