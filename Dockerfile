FROM alpine:3.10.1

RUN apk add --no-cache \
  python3 \
  libevent \
  libpq && \
  apk add --no-cache --virtual .build-deps \
  python3-dev \
  postgresql-dev \
  libevent-dev \
  musl-dev \
  gcc && \
  python3 -m ensurepip && \
  pip3 install --upgrade pip && \
  pip install pgcli && \
  apk del .build-deps

COPY docker-entrypoint.sh .

ENTRYPOINT [ "./docker-entrypoint.sh" ]
