#!/bin/bash

cp /dev/null ../webapp/logs/nginx/access.log
cp /dev/null ../webapp/logs/mysql/mysql-slow.log
docker exec -it webapp-nginx-1 nginx -s reopen
./bin/benchmarker -t "http://localhost" -u ./userdata
