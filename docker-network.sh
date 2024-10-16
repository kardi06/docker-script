#! Melihat network
docker network ls

#! Membuat network
docker network create --driver bridge networkname

docker network create --driver bridge contohnetwork

#! hapus network
docker network rm networkname


# Contoh kasus konek ke container mongodb , mongo-express dengan netwwork

# buat networknya
docker network create --driver bridge mongonetwork

# buat container mongoDB
docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=eko --env MONGO_INITDB_ROOT_PASSWORD=eko mongo:latest

# pull image
docker image pull mongo-express:latest

# buat container mongoexpress
docker container create --name mongodbexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://eko:eko@mongodb:27017/" mongo-express:latest
# catatan : "mongodb://eko:eko@mongodb:27017/ -> url yang nanti akan diakses di browser
# eko-> usernameny ->dari  --env MONGO_INITDB_ROOT_USERNAME=eko
# eko-> password ->dari  --env MONGO_INITDB_ROOT_PASSWORD=eko
# @mongodb:27017/ -> nama containernya + portnya


docker container start mongodb

docker container start mongodbexpress

docker network disconnect mongonetwork mongodb

docker network connect mongonetwork mongodb