#!/bin/bash

set -e


SHORT_SHA=$(git rev-parse --short HEAD)
DOCKER_TAG="0.1.${CIRCLE_BUILD_NUM}-${SHORT_SHA}"



build_docker
