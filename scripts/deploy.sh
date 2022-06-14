#!/bin/bash
echo "> 22.06.14 15:20 배포이후 시스템을 시작합니다" >> /home/ec2-user/deploy.log
BUILD_JAR=$(ls /home/ec2-user/build/libs/gradle-22.06.14.jar)     # jar가 위치하는 곳

CURRENT_PID=$(pgrep java)
echo "> 현재 실행중인 애플리케이션 pid = $CURRENT_PID" >> /home/ec2-user/deploy.log

if [ -z $CURRENT_PID ]
then
  echo "> 현재 구동중인 어플리케이션이 없으므로 종료하지 않습니다" >> /home/ec2-user/deploy.log
else
  echo "> 현재 구동중인 어플이 존재하므로 종료합니다" >> /home/ec2-user/deploy.log
  echo "> kill -15 $CURRENT_PID" >> /home/ec2-user/deploy.log
  kill -15 $CURRENT_PID
  sleep 10
fi

echo "서비스를 실행합니다" >> /home/ec2-user/deploy.log
echo nohup sudo java -jar $BUILD_JAR \& >> /home/ec2-user/deploy.log 2>/home/ec2-user/deploy_err.log &