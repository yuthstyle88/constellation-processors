#!/bin/bash

echo "Stopping constellation services..."

SERVICES=(
  constellation-server.service
  constellation-lake-sink.service
  constellation-aggregator.service
)

for service in "${SERVICES[@]}"; do
  echo "Stopping $service..."
  sudo systemctl stop "$service"
done

echo "All constellation services stopped."
