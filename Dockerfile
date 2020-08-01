FROM ubuntu:19.10
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
       build-essential \
       gettext \
       openssl \
       software-properties-common \
       apt-transport-https \
       curl \
       gnupg2 \
       alsa-utils \
       gstreamer1.0-alsa \
       gstreamer1.0-tools \
       python3 \
       python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -k "https://apt.mopidy.com/mopidy.gpg" | apt-key add - && \
    curl -k "https://apt.mopidy.com/buster.list" > /etc/apt/sources.list.d/mopidy.list && \
    apt-get remove -y curl
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
       mopidy \
       mopidy-alsamixer \
       mopidy-local \
       mopidy-mpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN python3 -m pip install Mopidy-Iris
RUN mkdir -p /data/music
EXPOSE 6680 6600
CMD ["/usr/bin/mopidy"]
