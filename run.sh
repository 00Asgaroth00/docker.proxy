#!/usr/bin/env bash

docker run \
	--name=package-cache \
	--rm \
	--publish=8080:80 \
	--volume=/tmp/cache-test:/var/cache/nginx:Z \
	harbor.asgaroth.cloudns.be/library/00asgaroth00/package-cache:v3.21
