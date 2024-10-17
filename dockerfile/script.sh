# FROM instruction
docker built -t kardi/from from
#from yang terakhir itu nama folder tempat dockerfilenya berada

docker image ls

# RUN instruction
docker build -t kardi/run:latest run

docker build -t kardi/run:1.0 run --progress=plain --no-cache

# COMMAND instruction
docker build -t kardi/command command

docker image inspect kardi/command

# LABEL Instruction
docker build -t khannedy/label label

docker image inspect khannedy/label

# ADD Instruction
docker build -t khannedy/add add

docker container create --name add khannedy/add

docker container start add

docker container logs add