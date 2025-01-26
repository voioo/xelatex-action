FROM alpine:latest

LABEL org.opencontainers.image.source="https://github.com/voioo/xelatex-action"
LABEL org.opencontainers.image.description="XeLaTeX compiler with essential TeXLive distribution"
LABEL org.opencontainers.image.licenses="0BSD"

RUN apk add --no-cache \
    texlive \
    texmf-dist \
    texlive-luatex \
    fontconfig \
    msttcorefonts-installer \
    font-awesome-free \
    font-noto \
    font-noto-emoji \
    font-dejavu \
    ttf-liberation \
    && update-ms-fonts \
    && fc-cache -fv


RUN mkdir -p /usr/share/texmf-local/fonts/opentype && \
    mktexlsr && \
    texhash && \
    luaotfload-tool --update

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
