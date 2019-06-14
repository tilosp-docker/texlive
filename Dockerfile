FROM tilosp/texlive:latest

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        plantuml \
    ; \
    rm -rf /var/lib/apt/lists/*
