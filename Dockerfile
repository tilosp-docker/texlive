FROM tilosp/texlive:latest

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        plantuml \
        graphviz \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir -p /opt/local/bin; \
    ln -s /usr/bin/dot /opt/local/bin/dot
