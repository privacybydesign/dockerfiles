FROM privacybydesign/debian:latest

ENV GO_VERSION="1.18.3"
ENV GO_CHECKSUM="956f8507b302ab0bb747613695cdae10af99bbd39a90cae522b7c0302cc27245"

LABEL version=$GO_VERSION

ENV GOPATH /go
ENV PATH ${PATH}:${GOPATH}/bin:/usr/local/go/bin

COPY golang.sh /dockerfiles/
RUN bash /dockerfiles/golang.sh && rm -r /dockerfiles

RUN go version