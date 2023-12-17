#!/bin/bash

cp /dev/null ../webapp/logs/nginx/access.log
cp /dev/null ../webapp/logs/mysql/mysql-slow.log
docker exec -it webapp-nginx-1 nginx -s reopen
./bin/benchmarker -t "http://localhost" -u ./userdata

# 現在時刻を yyyymmddhhmmss 形式で取得
now=$(date '+%Y%m%d%H%M%S')

cat ../webapp/logs/nginx/access.log | alp json -m "/image/\d+.(jpg|png|gif),/posts/\d+,@.+" -o count,method,uri,min,avg,max > ../webapp/logs/alp/alp_${now}.log
mysqldumpslow ../webapp/logs/mysql/mysql-slow.log > ../webapp/logs/mysqldumpslow/mysql-slow_${now}.log
