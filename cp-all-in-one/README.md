![image](../images/confluent-logo-300-2.png)
  
# Documentation

You can find the documentation and instructions for this repo at [https://docs.confluent.io/platform/current/tutorials/build-your-own-demos.html](https://docs.confluent.io/platform/current/tutorials/build-your-own-demos.html?utm_source=github&utm_medium=demo&utm_campaign=ch.examples_type.community_content.cp-all-in-one)

## Description of files

- `docker-compose-as-shipped.yml` - docker-compose.yml as it appeared in the forked repo
- `docker-compose-broker1.yml`  - docker-compose.yml with just one broker, before adding labels
- `docker-compose-three-brokers.yml`  - docker-compose.yml with three brokers, before adding labels
- `docker-compose-zookeeper-and-broker.yml`  - docker-compose.yml with ZooKeeper, consumergroup, and partition metricsets
- `docker-compose.yml`  - docker-compose.yml in its final state, with the addition of the broker metricset and jolokia
- `filebeat.docker.yml` - filebeat docker configuration
- `filebeat.sh` - script to setup and start Filebeat
- `metricbeat.docker.yml` - Metricbeat docker configuration
- `metricbeat.sh` - script to setup and start Metricbeat
