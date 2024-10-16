#FROM instruction
docker built -t kardi/from from
#from yang terakhir itu nama folder tempat dockerfilenya berada

docker image ls

#RUN instruction
docker build -t kardi/run:latest run

docker build -t kardi/run:1.0 run --progress=plain --no-cache
