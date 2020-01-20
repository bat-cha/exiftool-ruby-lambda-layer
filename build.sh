#!/bin/bash -x

set -e

rm -rf layer
docker build -t exiftool-ruby-lambda-layer .
CONTAINER=$(docker run -d exiftool-ruby-lambda-layer false)
docker cp $CONTAINER:/bin layer
docker rm $CONTAINER
touch layer/.slsignore
cat > layer/.slsignore << EOF
**/*.a
**/*.la
share/**
include/**
bin/**
EOF