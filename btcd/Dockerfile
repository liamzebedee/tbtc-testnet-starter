FROM golang:alpine
MAINTAINER liamzebedee

ENV GO111MODULE=on

RUN go get github.com/btcsuite/btcd
RUN go get github.com/btcsuite/btcwallet@95d7aa0b4953bd67cd265f4a378ea2cde52c54d1

ADD run.sh /app/run.sh
ADD wallet.sh /app/wallet.sh

ADD *.conf /app/