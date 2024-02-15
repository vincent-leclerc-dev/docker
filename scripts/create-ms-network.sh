#!/bin/bash

NETWORK_NAME="ms-network"
NETWORK_DRIVER="bridge"

echo -e "trying to create ${NETWORK_NAME} \r"

docker network create -d ${NETWORK_DRIVER} ${NETWORK_NAME}

echo -e "network list: \r"

docker network ls
