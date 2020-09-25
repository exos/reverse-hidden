# Reverse proxy for hidden service docker image

## Stack

* nginx
* privoxy
* tor

## Build own reverse proxy

    docker build . --build-args ONION=myonionxxxxxx.onion -t reverse-hidden

## Up

    docker run -d -p 8000:8000 reverse-hidden
