#! melihat list volume
docker volume ls

#! membuat volume
docker volume create volumename

#! hapus volume
docker volume rm volumename

#! menggunakan container bind volume
docker volume create mongodata

docker container create --name mongovolume --mount "type=volume,source=mongodata,destination=/data/db" --publish 27019:27017 --env MONGO_INITDB_ROOT_USERNAME=admin --env MONGO_INITDB_ROOT_PASSWORD=password  mongo:latest

docker container start mongovolume