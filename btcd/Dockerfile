FROM golang:alpine
MAINTAINER liamzebedee

ENV GO111MODULE=on

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN mkdir -p $GOPATH/src/github.com/btcsuite && \
    git clone https://github.com/btcsuite/btcd && \
    mv btcd $GOPATH/src/github.com/btcsuite && \
    cd $GOPATH/src/github.com/btcsuite/btcd && \
    git checkout v0.20.1-beta && \
    GO111MODULE=on go install -v . ./cmd/...

# https://github.com/darwin/simverse/commit/4f55bdc7c28b52c896f0af2fbc3c6706124b1a37
# https://github.com/darwin/simverse/issues/8
RUN go get github.com/btcsuite/btcwallet@95d7aa0b4953bd67cd265f4a378ea2cde52c54d1

ADD run.sh /app/run.sh
ADD wallet.sh /app/wallet.sh

ADD *.conf /app/