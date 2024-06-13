FROM ghcr.io/linuxserver/baseimage-alpine-nginx:3.19

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CERTBOT_VERSION
LABEL build_version="xx.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="xxx"

# environment settings

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

RUN set -ex; \
    apk add --no-cache \
        radicale=3.1.9-r1 \
    ;

COPY radicale.config /etc/radicale/config

EXPOSE 5232

ENTRYPOINT ["radicale"]
CMD ["--debug"]
