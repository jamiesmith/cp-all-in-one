#!/bin/bash

docker run --rm \
    --name=filebeat-setup \
    --volume="$(pwd)/filebeat.docker.yml:/usr/share/filebeat/filebeat.yml:ro" \
    docker.elastic.co/beats/filebeat:7.11.1 \
    -E cloud.id=${CLOUD_ID} \
    -E cloud.auth=${CLOUD_AUTH} \
    -e -strict.perms=false \
    setup

echo "Launching filebeat"

docker rm -f filebeat

docker run -d \
    --name=filebeat \
    --user=root \
    --volume="$(pwd)/filebeat.docker.yml:/usr/share/filebeat/filebeat.yml:ro" \
    --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
    docker.elastic.co/beats/filebeat:7.11.1 \
    -E cloud.id=${CLOUD_ID} \
    -E cloud.auth=${CLOUD_AUTH} \
    -e -strict.perms=false



