#!/bin/bash

# Enter Kafka container
docker exec -it constellation-processors-kafka-1 bash -c "
  echo 'Creating Kafka topics...'

  # Create the input topic (encrypted reports)
  kafka-topics.sh \
    --create \
    --bootstrap-server localhost:9092 \
    --topic p3a-star-enc \
    --partitions 1 \
    --replication-factor 1

  # Create the output topic (decrypted results)
  kafka-topics.sh \
    --create \
    --bootstrap-server localhost:9092 \
    --topic p3a-star-out \
    --partitions 1 \
    --replication-factor 1

  echo 'Current Kafka topics:'
  kafka-topics.sh --list --bootstrap-server localhost:9092
"
