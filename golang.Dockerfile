FROM privacybydesign/debian:latest

ENV GO_VERSION="1.16.6"
ENV GO_CHECKSUM="be333ef18b3016e9d7cb7b1ff1fdb0cac800ca0be4cf2290fe613b3d069dfe0d"

LABEL version=$GO_VERSION

ENV GOPATH /go
ENV PATH ${PATH}:${GOPATH}/bin:/usr/local/go/bin

COPY golang.sh /dockerfiles/
RUN bash /dockerfiles/golang.sh && rm -r /dockerfiles

RUN go version