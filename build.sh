#!/usr/bin/env bash

docker buildx build --platform linux/amd64 -f Dockerfile -t harbor.asgaroth.cloudns.be/library/00asgaroth00/package-cache:v3.21 --push .
