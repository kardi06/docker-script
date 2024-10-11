#! Tahapan Backup Volume

#! Matikan container
docker container stop mongovolume

#! Buat folder baru unutk backup
#!contoh: source=/Users/abangkuy/Developments/belajar-docker-dasar/backup
mkdir /backup

#! Membuat backup Continer
#! mount pertama untuk folder backup di host
#! mount kedua untuk volume yang akan di backup
docker container create --name nginxbackup --mount "type:bind,source:/Users/abangkuy/Developments/belajar-docker-dasar/backup,destination:/backup" --mount "type=volume,source=mongodata,destination:/data/" nginx:latest

#! jalankan container backupnya
container start nginxbackup

#! masuk ke container backupnya
docker container exec -i -t nginxbackup /bin/bash

#! buat file tar nya untuk file backup
tar cvf /backup/backup.tar.gz /data/

#! stop dan remove nginx backupnya
docker container stop nginxbackup
docker container rm nginxbackup

#! Jalankan lagi container yang aslinya
docker container start mongovolume


#! Cara Simplenya
docker container run --rm --name ubuntu --mount "type:bind,source:/Users/abangkuy/Developments/belajar-docker-dasar/backup,destination:/backup" --mount "type=volume,source=mongodata,destination:/data/" ubuntu:latest tar cvf /backup/backup-lagi.tar.gz /data/

################################# DOCKER VOLUME RESTORE ###################################

#! DOcker create volume restore
docker volume create mongorestore

#! Container untuk mengisi file backup => unzip file yang sudah di backup
docker container run --rm --name ubunturestore --mount "type=bind,source=/Users/khannedy/Developments/YOUTUBE/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"

#! Container Baru yang menggunakan data backupnya
docker container create --name mongorestore --publish 27020:27017 --mount "type=volume,source=mongorestore,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=eko --env MONGO_INITDB_ROOT_PASSWORD=eko mongo:latest

docker container start mongorestore
