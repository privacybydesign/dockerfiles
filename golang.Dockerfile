FROM privacybydesign/debian:latest

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

COPY golang.sh /dockerfiles/
RUN bash /dockerfiles/golang.sh && rm -r /dockerfiles

RUN go version