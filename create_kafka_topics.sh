#!/bin/bash

# Script to create required Kafka topics inside the Kafka Docker container

CONTAINER_NAME="constellation-processors-kafka-1"
BOOTSTRAP_SERVER="localhost:9092"

docker exec -it "$CONTAINER_NAME" bash -c "
  echo 'Creating Kafka topics...'

  # Input topics (encrypted reports)
  kafka-topics.sh --create --if-not-exists \
    --bootstrap-server $BOOTSTRAP_SERVER \
    --topic p3a-star-enc \
    --partitions 1 \
    --replication-factor 1

  kafka-topics.sh --create --if-not-exists \
    --bootstrap-server $BOOTSTRAP_SERVER \
    --topic p3a-star-enc-express \
    --partitions 1 \
    --replication-factor 1

  kafka-topics.sh --create --if-not-exists \
    --bootstrap-server $BOOTSTRAP_SERVER \
    --topic p3a-star-enc-slow \
    --partitions 1 \
    --replication-factor 1

  # Output topics (decrypted results)
  kafka-topics.sh --create --if-not-exists \
    --bootstrap-server $BOOTSTRAP_SERVER \
    --topic p3a-star-out \
    --partitions 1 \
    --replication-factor 1

  kafka-topics.sh --create --if-not-exists \
    --bootstrap-server $BOOTSTRAP_SERVER \
    --topic p3a-star-out-express \
    --partitions 1 \
    --replication-factor 1

  kafka-topics.sh --create --if-not-exists \
    --bootstrap-server $BOOTSTRAP_SERVER \
    --topic p3a-star-out-slow \
    --partitions 1 \
    --replication-factor 1

  echo ''
  echo '✅ Done creating topics.'
  echo '📋 Current Kafka topics:'
  kafka-topics.sh --list --bootstrap-server $BOOTSTRAP_SERVER
"