FROM ubuntu

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends texlive-full; \
    rm -rf /var/lib/apt/lists/*
