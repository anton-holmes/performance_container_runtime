#!/bin/bash
# docker pull nginx
docker run -itd --name nginx_perform nginx sh -c "service nginx stop"
START=$(docker inspect --format='{{.State.StartedAt}}' nginx_perform)
STOP=$(docker inspect --format='{{.State.FinishedAt}}' nginx_perform)
echo $START
echo $STOP
START_TIMESTAMP=$(date --date=$START +%s)
STOP_TIMESTAMP=$(date --date=$STOP +%s)
# # let "t=$START-$STOP"
# # echo $t
# echo $(($STOP_TIMESTAMP-$START_TIMESTAMP))
echo $STOP_TIMESTAMP-$START_TIMESTAMP
docker rm nginx_perform
# Если вы выполняете расчеты ночью с одного дня на другой, то могут быть ошибки