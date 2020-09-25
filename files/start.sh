#!/bin/sh

echo "Starting nginx"
service nginx start

echo "Starting Privoxy"
service privoxy start

echo "Starting TOR"
service tor start
