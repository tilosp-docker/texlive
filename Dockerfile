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

ENV PLANTUML_VERSION 1.2019.6

RUN set -ex; \
    apt-get update; \
    apt-get install -y curl; \
    curl -fsSL -o /usr/share/plantuml/plantuml.jar "https://netix.dl.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar"; \
    apt-get purge -y curl; \
    rm -rf /var/lib/apt/lists/*
