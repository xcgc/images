FROM node:14-buster-slim

LABEL org.opencontainers.image.source https://github.com/xcgc/images

RUN apt-get update -y \
   && apt-get install -y curl ca-certificates openssl git tar zip sqlite fontconfig tzdata iproute2 make ffmpeg sqlite3 build-essential python3 \
   && useradd -d /home/container -m container

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

USER container
ENV USER=container 
ENV HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
