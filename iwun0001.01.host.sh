#!/bin/bash
#--------------------------------------------------------------------------
# Docker Example 1:  Host networks
# Using image Nginx
# S.C Iwuno
# Documentation:  Docker docs
# containers:  /var/lib/docker/containers
#--------------------------------------------------------------------------
clear
echo "+------------------------------------------------------------------------------+"
echo "|  Pulling Nginx from HUB                                                     |"
echo "+------------------------------------------------------------------------------+"
docker pull nginx

echo "+------------------------------------------------------------------------------+"
echo "|   Creating HTML                                                         |"
echo "+------------------------------------------------------------------------------+"
cd ~
mkdir sharedoc && cd sharedoc
touch index.html && echo " <html>
  <head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-MfvZlkHCEqatNoGiOXveE8FIwMzZg4W85qfrfIFBfYc= sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
    <title>Docker nginx Tutorial</title>
  </head>
  <body>
    <div class="container">
      <h1>Hello NET2003A</h1>
      <p>This nginx page is brought to you by Docker and Samuel Iwuno</p>
    </div>
  </body>
</html> " > index.html 
echo "Done"
ls -l
echo "+------------------------------------------------------------------------------+"
echo "|   Running Containers                                                         |"
echo "+------------------------------------------------------------------------------+"
docker run --name=iwun0001_nginx --network host -dit  -v ~/sharedoc:/usr/share/nginx/html  -p 80:80 nginx
docker container ls

echo "+------------------------------------------------------------------------------+"
echo "|   Inspect Docker Host Network                                              |"
echo "+------------------------------------------------------------------------------+"
docker network ls
docker network inspect host

echo "+------------------------------------------------------------------------------+"
echo "|   Press [ ENTER ] to continue ...                                            |"
echo "+------------------------------------------------------------------------------+"
read CONTINUE

echo "+------------------------------------------------------------------------------+"
echo "|   Stop and Remove Containers                                                 |"
echo "+------------------------------------------------------------------------------+"
rm ~/sharedoc/*
rmdir ~/sharedoc
docker stop iwun0001_nginx
docker rm iwun0001_nginx
