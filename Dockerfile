FROM adoptopenjdk/openjdk14:debian-slim

LABEL org.opencontainers.image.source https://github.com/xcgc/images

RUN apt-get update -y \
   && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
   && useradd -d /home/container -m container

USER container
ENV USER=container 
ENV HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
