#
# Dockerfile for openconnect
#

FROM alpine:3.13
MAINTAINER smarteist

RUN set -xe && apk add --no-cache nettle openconnect

COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 443/tcp
EXPOSE 443/udp

ENTRYPOINT ["sh", "/entrypoint.sh"]

