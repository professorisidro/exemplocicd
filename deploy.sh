#!/bin/bash

if [ -f deploy.pid ]; then
   OLDPID=$(cat deploy.pid)
   sudo kill -9 $OLDPID
   DATAKILL=$(date +"%d/%m/%Y - %H:%M:%S")
   echo "$DATAKILL - Stopping Current API Version - PID $OLDPID" >> deploy.log
fi

nohup /home/opc/jdk-20.0.2/bin/java -jar ./api/target/exemplocicd-0.0.1-SNAPSHOT.jar > nohup.out &
PID=$!
echo $PID > deploy.pid
DATA=$(date +"%d/%m/%Y - %H:%M:%S")
echo "$DATA - Starting new deploy - new PID $PID" >> deploy.log
