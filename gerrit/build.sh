#!/bin/bash -xe

readonly __SCRIPT_DIR="$(echo $(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && cd .. && pwd))"

mkdir -p ${GOPATH}/src/github.com/google/
rm -f ${GOPATH}/src/github.com/google/concourse-resources
ln -s ${__SCRIPT_DIR}/ ${GOPATH}/src/github.com/google/concourse-resources
make

IMAGE=gerrit-resource
TAG=${TAG:-$(git describe --tags --always)}
docker build -f Dockerfile -t summittech/$IMAGE:$TAG -t summittech/$IMAGE:latest .

docker push summittech/$IMAGE:$TAG
docker push summittech/$IMAGE:latest
