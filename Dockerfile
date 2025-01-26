FROM alpine:latest

LABEL org.opencontainers.image.source="https://github.com/voioo/xelatex-action"
LABEL org.opencontainers.image.description="XeLaTeX compiler with essential TeXLive distribution"
LABEL org.opencontainers.image.licenses="0BSD"

RUN apk add --no-cache \
    texlive-xetex \
    texlive-latex \
    texlive-latexextra \
    texlive-science \
    texlive-fontsextra \
    msttcorefonts-installer \
    fontconfig \
    font-noto \
    font-noto-cjk \
    font-noto-extra \
    font-dejavu \
    font-liberation \
    ttf-font-awesome \
    ttf-liberation \
    ttf-dejavu \
    && update-ms-fonts \
    && fc-cache -f

RUN mkdir -p /usr/share/texmf-dist/fonts/opentype
RUN mktexlsr

RUN luaotfload-tool --update

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
