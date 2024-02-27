#!/bin/bash


set -e -x

export APP_JAR=spring-simple-grafana-0.0.1-SNAPSHOT.jar;
export IMAGE=cloudcheflabs/spring-simple-grafana:latest


for i in "$@"
do
case $i in
    --jar=*)
    APP_JAR="${i#*=}"
    shift
    ;;
    --image=*)
    IMAGE="${i#*=}"
    shift
    ;;
    *)
          # unknown option
    ;;
esac
done

echo "APP_JAR = ${APP_JAR}"
echo "IMAGE = ${IMAGE}"


# move to build directory.
cd ../


# build all.
./gradlew clean build -x test;


# add fat jar to docker directory.
cp build/libs/$APP_JAR docker;

set +e -x

## remove old docker image.
IFS=: read -r IMAGE_PREFIX IMAGE_TAG <<< "$IMAGE"
echo "image prefix: $IMAGE_PREFIX"

docker rmi -f $(docker images -a | grep ${IMAGE_PREFIX} | awk '{print $3}')

set -e -x

## build.
docker build \
--build-arg APP_JAR=${APP_JAR} \
-t ${IMAGE} \
./docker;


## remove fat jar from docker directory.
rm -rf docker/$APP_JAR;

# push docker image.
docker push ${IMAGE};
