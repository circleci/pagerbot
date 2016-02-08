#!/bin/bash

set -e


SHORT_SHA=$(git rev-parse --short HEAD)
DOCKER_TAG="0.1.${CIRCLE_BUILD_NUM}-${SHORT_SHA}"

build_docker() {
   DOCKER_BUILD_PATH=/tmp/pb-docker
   mkdir -p ${DOCKER_BUILD_PATH}

   #cp Dockerfile ${DOCKER_BUILD_PATH}/
   #cp Gemfile ${DOCKER_BUILD_PATH}/

   pushd ${DOCKER_BUILD_PATH}
   docker build -t circleci/pagerbot:${DOCKER_TAG} .
   popd
}

# build_docker
