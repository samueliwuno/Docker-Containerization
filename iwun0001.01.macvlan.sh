#!/bin/bash
#--------------------------------------------------------------------------
# Docker macvlans
# Using image centos
# S.C Iwuno
# Documentation:  Docker docs
# containers:  /var/lib/docker/containers
#--------------------------------------------------------------------------
clear
echo "+------------------------------------------------------------------------------+"
echo "|  Pulling Alpine from HUB                                                     |"
echo "+------------------------------------------------------------------------------+"
docker pull alpine

echo "+------------------------------------------------------------------------------+"
echo "|   Creating and inspecting Data Volume                                                        |"
echo "+------------------------------------------------------------------------------+"
docker volume create --name iwun0001_data
docker volume ls
echo "+------------------------------------------------------------------------------+"
echo "|  Create and Inspect macvlan Network                                              |"
echo "+------------------------------------------------------------------------------+"
 docker network create -d macvlan \
  --subnet=172.16.56.0/24 \
  --gateway=172.16.56.11 \
  -o parent=enp3s0 \
  iwun0001_macvlan
docker network ls
echo "+------------------------------------------------------------------------------+"
echo "|   Running Containers                                                         |"
echo "+------------------------------------------------------------------------------+"
docker run --name iwun0001_alp --network iwun0001_macvlan -dit  --rm -v iwun0001_data:/iwun0001_data alpine


docker container ls
docker container inspect iwun0001_alp
docker exec iwun0001_alp ip addr show eth0
docker exec iwun0001_alp ip route







echo "+------------------------------------------------------------------------------+"
echo "|   Press [ ENTER ] to continue ...                                            |"
echo "+------------------------------------------------------------------------------+"


read CONTINUE

echo "+------------------------------------------------------------------------------+"
echo "|   Stop and Remove Containers                                                 |"
echo "+------------------------------------------------------------------------------+"
docker stop iwun0001_alp
docker rm iwun0001_alp
docker network rm iwun0001_macvlan


