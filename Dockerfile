FROM debian:sid-slim

LABEL org.opencontainers.image.source="https://github.com/voioo/xelatex-action"
LABEL org.opencontainers.image.description="XeLaTeX compiler with full TeXLive distribution"
LABEL org.opencontainers.image.licenses="0BSD"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive-full \
    fonts-font-awesome \
    fonts-rubik \
    fonts-lmodern \
    fonts-texgyre \
    fonts-dejavu-core \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Refresh font cache
RUN luaotfload-tool --update

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
