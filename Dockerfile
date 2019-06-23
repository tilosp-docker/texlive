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

ENV PLANTUML_VERSION 1.2019.5

RUN set -ex; \
    apt-get update; \
    apt-get install -y curl; \
    curl -fsSL -o /usr/share/plantuml/plantuml.jar "https://netix.dl.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar"; \
    apt-get purge -y curl; \
    rm -rf /var/lib/apt/lists/*
    
RUN set -ex; \
    apt-get update; \
    apt-get install -y curl openjdk-11-jdk-headless openjfx pandoc; \
    curl -fsSL -o ~/swagger2markup-cli.jar https://jcenter.bintray.com/io/github/swagger2markup/swagger2markup-cli/1.3.3/swagger2markup-cli-1.3.3.jar; \
    curl -fsSL -o ~/TeXDoclet.jar http://doclet.github.io/resources/bin/TeXDoclet.jar; \
    apt-get purge -y curl; \
    rm -rf /var/lib/apt/lists/*
