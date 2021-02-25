#!/bin/bash

# Setup
#
docker run --rm \
    --name=metricbeat-setup \
    --volume="$(pwd)/metricbeat.docker.yml:/usr/share/metricbeat/metricbeat.yml:ro" \
    docker.elastic.co/beats/metricbeat:7.11.1 \
    -E cloud.id=${CLOUD_ID} \
    -E cloud.auth=${CLOUD_AUTH} \
    -e -strict.perms=false \
    setup

echo "Launching metricbeat"

docker rm -f metricbeat

docker run -d \
    --name=metricbeat \
    --user=root \
    --network cp-all-in-one_default \
    --volume="$(pwd)/metricbeat.docker.yml:/usr/share/metricbeat/metricbeat.yml:ro" \
    --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
    docker.elastic.co/beats/metricbeat:7.11.1 \
    -E cloud.id=${CLOUD_ID} \
    -E cloud.auth=${CLOUD_AUTH} \
    -e -strict.perms=false
