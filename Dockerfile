FROM debian:stable
MAINTAINER exos <exos@kaktheplanet.xyz>

ARG ONION=facebookcorewwwi.onion

RUN apt-get update && apt-get install -y gnupg dirmngr
RUN apt-get update && apt-get install -y tor sudo nginx privoxy 

ADD files/nginx.conf /etc/nginx/
ADD files/torrc /etc/tor/
ADD files/privoxy.conf /etc/privoxy/config
ADD files/start.sh /data/bin/

RUN sed -i "s/ONION/${ONION}/g" /etc/nginx/nginx.conf &&\
    chmod +x /data/bin/start.sh

EXPOSE 8000

ENTRYPOINT /data/bin/start.sh
