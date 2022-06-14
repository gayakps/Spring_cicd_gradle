#!/bin/bash
echo "시스템을 시작합니다"
BUILD_JAR=$(ls /home/ec2-user/build/libs/gradle-22.06.14.jar)     # jar가 위치하는 곳
JAR_NAME=$(basename $BUILD_JAR)

echo "> build 파일명: $JAR_NAME" >> /home/ec2-user/deploy.log
echo "> build 파일 복사" >> /home/ec2-user/deploy.log
DEPLOY_PATH=/home/ec2-user/
cp $BUILD_JAR $DEPLOY_PATH

echo "> 현재 실행중인 애플리케이션 pid 확인" >> /home/ec2-user/deploy.log
CURRENT_PID=$(pgrep -f gradle-0.0.1-SNAPSHOT.jar )

if [ -z $CURRENT_PID ]
then
  echo "현재 구동중인 어플리케이션이 없으므로 종료하지 않습니다"
else
  echo "현재 구동중인 어플이 존재하므로 종료합니다"
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi


DEPLOY_JAR=$DEPLOY_PATH$JAR_NAME
echo "> DEPLOY_JAR 배포"    >> /home/ec2-user/deploy.log
echo "서비스를 실행합니다"
nohup sudo java -jar $DEPLOY_JAR \& >> /home/ec2-user/deploy.log 2>/home/ec2-user/deploy_err.log &