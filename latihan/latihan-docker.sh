docker container create --name contohmongobind --mount "type=bind,source=D:/data-docker/bind,destination=/data/db" -p 27018:27017 --env MONGO_INITDB_ROOT_USERNAME=admin --env MONGO_INITDB_ROOT_PASSWORD=doc mongo:latest