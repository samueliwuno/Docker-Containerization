#!/bin/bash
#--------------------------------------------------------------------------
# Docker Bridged:  Bridge networks
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
echo "|   Running Containers                                                         |"
echo "+------------------------------------------------------------------------------+"
docker run -dit --name iwun0001_alp1 alpine 
docker run -dit --name iwun0001_alp2 alpine 
docker container ls

echo "+------------------------------------------------------------------------------+"
echo "|   Inspect Docker Bridge Network                                              |"
echo "+------------------------------------------------------------------------------+"
docker network inspect bridge



echo "+------------------------------------------------------------------------------+"
echo "|   Press [ ENTER ] to continue ...                                            |"
echo "+------------------------------------------------------------------------------+"


read CONTINUE

echo "+------------------------------------------------------------------------------+"
echo "|   Stop and Remove Containers                                                 |"
echo "+------------------------------------------------------------------------------+"
docker stop iwun0001_alp1
docker stop iwun0001_alp2
docker rm iwun0001_alp1
docker rm iwun0001_alp2
