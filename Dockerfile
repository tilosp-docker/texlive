FROM ubuntu:disco

RUN set -ex; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends
        texlive \
        texlive-lang-german \
        texlive-lang-english \
        texlive-latex-extra \
        texlive-fonts-extra \
        texlive-formats-extra \
        texlive-bibtex-extra \
        latexmk \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends
        python-pygments \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends
        openjdk-11-jre-headless \
    ; \
    rm -rf /var/lib/apt/lists/*
