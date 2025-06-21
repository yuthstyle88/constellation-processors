#!/bin/bash

echo "Starting constellation services..."

SERVICES=(
  constellation-server.service
  constellation-lake-sink.service
  constellation-aggregator.service
)

for service in "${SERVICES[@]}"; do
  echo "Starting $service..."
  sudo systemctl start "$service"
done

echo "All constellation services started."
