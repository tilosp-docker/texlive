FROM ubuntu

RUN set -ex; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends texlive-full; \
    rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    fetchDeps=" \
        unzip \
        curl \
    "; \
    apt-get update; \
    apt-get install -y --no-install-recommends $fetchDeps; \
    \
    curl -fsSL -o picins.zip http://mirrors.ctan.org/macros/latex209/contrib/picins.zip; \
    echo "de77751b90dda6c776ebe13b3c850b9646be3ac6b45b3ee9f7bcf8b9a9e078f9 *picins.zip" | sha256sum -c -; \
    mkdir -p /usr/share/texlive/texmf-dist/tex/latex; \
    unzip picins.zip -d /usr/share/texlive/texmf-dist/tex/latex; \
    rm picins.zip; \
    texhash; \
    \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $fetchDeps; \
    rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends python3-pygments; \
    rm -rf /var/lib/apt/lists/*
