FROM python:3.9-slim-buster

LABEL org.opencontainers.image.source https://github.com/xcgc/images

RUN apt-get update -y \
   && apt-get install -y curl ca-certificates openssl git tar zip sqlite fontconfig tzdata iproute2 gcc g++ ffmpeg \
   && useradd -d /home/container -m container

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
   && chmod a+rx /usr/local/bin/youtube-dl

USER container
ENV USER=container 
ENV HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
