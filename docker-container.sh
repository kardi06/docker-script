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