FROM debian:stable
MAINTAINER exos <exos@kaktheplanet.xyz>

ARG ONION=facebookcorewwwi.onion

RUN apt-get update && apt-get install -y gnupg dirmngr
# ADD files/tor.list /etc/apt/sources.list.d/
# RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
# RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
# RUN apt-key adv --keyserver keys.gnupg.net --recv-keys A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 
RUN apt-get update && apt-get install -y tor sudo nginx privoxy 

ADD files/nginx.conf /etc/nginx/
ADD files/torrc /etc/tor/
ADD files/privoxy.conf /etc/privoxy/config
ADD files/start.sh /data/bin/

RUN sed -i "s/ONION/${ONION}/g" /etc/nginx/nginx.conf &&\
    chmod +x /data/bin/start.sh

EXPOSE 8000

ENTRYPOINT /data/bin/start.sh
