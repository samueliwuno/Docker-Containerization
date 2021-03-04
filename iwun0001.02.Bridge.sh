#!/bin/bash
#--------------------------------------------------------------------------
# Docker Bridged:  User-Defined Bridged
# Using image centos
# S.C. Iwuno
# Documentation:  Docker docs
# containers:  /var/lib/docker/containers
#--------------------------------------------------------------------------
clear
echo "+------------------------------------------------------------------------------+"
echo "|  Pulling Alpine from HUB                                                     |"
echo "+------------------------------------------------------------------------------+"
docker pull alpine

echo "+------------------------------------------------------------------------------+"
echo "|   Running Containers                                                         |"
echo "+------------------------------------------------------------------------------+"
docker run -dit --name iwun0001_alp1 alpine
docker run -dit --name iwun0001_alp2 alpine 
docker run -dit --name iwun0001_alp3 alpine 
docker run -dit --name iwun0001_alp4 alpine 
docker container ls

echo "+------------------------------------------------------------------------------+"
echo "|   Create, Connect and Inspect User-Defined Bridge Network                                              |"
echo "+------------------------------------------------------------------------------+"
docker network create iwun0001_net
docker network connect iwun0001_net iwun0001_alp1
docker network connect iwun0001_net iwun0001_alp2
docker network connect iwun0001_net iwun0001_alp3
docker network connect iwun0001_net iwun0001_alp4
docker network inspect iwun0001_net



echo "+------------------------------------------------------------------------------+"
echo "|   Press [ ENTER ] to continue ...                                            |"
echo "+------------------------------------------------------------------------------+"

read CONTINUE

echo "+------------------------------------------------------------------------------+"
echo "|   Stop and Remove Containers                                                 |"
echo "+------------------------------------------------------------------------------+"
docker stop iwun0001_alp1
docker stop iwun0001_alp2
docker stop iwun0001_alp3
docker stop iwun0001_alp4

docker rm iwun0001_alp1
docker rm iwun0001_alp2
docker rm iwun0001_alp3
docker rm iwun0001_alp4
docker network rm iwun0001_net
