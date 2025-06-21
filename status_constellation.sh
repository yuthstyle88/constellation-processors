#!/bin/bash

echo "Checking status of constellation services..."

SERVICES=(
  constellation-server.service
  constellation-lake-sink.service
  constellation-aggregator.service
)

for service in "${SERVICES[@]}"; do
  echo "-------------------------------"
  echo "Status of $service:"
  sudo systemctl status "$service" --no-pager
done
