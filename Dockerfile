FROM alpine:latest

LABEL org.opencontainers.image.source="https://github.com/voioo/xelatex-action"
LABEL org.opencontainers.image.description="XeLaTeX compiler with essential TeXLive distribution"
LABEL org.opencontainers.image.licenses="0BSD"

# Install required packages
RUN apk add --no-cache \
    texlive \
    texmf-dist \
    fontconfig \
    msttcorefonts-installer \
    font-awesome-free \
    font-noto \
    font-noto-emoji \
    font-dejavu \
    ttf-liberation \
    && update-ms-fonts \
    && fc-cache -fv

RUN mkdir -p /usr/share/texmf-dist/fonts/opentype && \
    mktexlsr && \
    luaotfload-tool --update

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
