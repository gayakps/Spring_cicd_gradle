#!/bin/bash
LOG_PATH=/home/ec2-user/deploy.log
echo "시작"
echo "> 22.06.15 01:54 배포이후 시스템을 시작합니다" >> $LOG_PATH
JAR_PATH=/home/ec2-user/build/libs/gradle-22.06.14.jar

CURRENT_PID=$(pgrep java)
echo "> 현재 실행중인 애플리케이션 pid = $CURRENT_PID" >> $LOG_PATH

if [ -z $CURRENT_PID ];
then
  echo "> 현재 구동중인 어플리케이션이 없으므로 종료하지 않습니다" >> $LOG_PATH
else
  echo "> 현재 구동중인 어플이 존재하므로 종료합니다" >> $LOG_PATH
  echo "> kill -9 $CURRENT_PID" >> $LOG_PATH
  kill -9 $CURRENT_PID
  sleep 5
fi

AFTER_PID=$(pgrep java)
echo "현재 남은 PID : $AFTER_PID" >> $LOG_PATH
echo "Starting Java Service" >> $LOG_PATH
cat $LOG_PATH;
echo "JAR NAME : $JAR_PATH" >> $LOG_PATH
chmod +x $JAR_PATH
nohup java -jar $JAR_PATH >> $LOG_PATH 2>/home/ec2-user/deploy_err.log &