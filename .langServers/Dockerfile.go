FROM golang:alpine

RUN apk --no-cache update && \
    apk --no-cache add \
      git \
    && \
    rm -rf /var/cache/apk/*

RUN go get github.com/sourcegraph/go-langserver

ENTRYPOINT go-langserver
