#! melihat container docker semua
docker container ls -a

#! melihat container docker running
docker container ls

#! membuat container
docker container create --name redis redis:latest

#! Jalankan container
docker container start redis

#! Stop container
docker container stop redis

#! Remove container
docker container rm redis

#! melihat log
docker container logs redis

#! melihat log secara live
docker container logs -f redis

#! masuk ke dalam container
docker container exec -i -t redis bin/bash

#! port Forwarding
docker container create --name contohnginx --publish 8080:80 nginx:latest

#! Environment Variable
docker container create --name contohmongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=admin 
--env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest

#! Melihat stats container
docker container stats 

#! mengatur resource limit
docker container create --name contohnginx --publish 8080:80 --memory 128m --cpus 0.5 nginx:latest


