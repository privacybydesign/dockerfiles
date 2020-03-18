FROM privacybydesign/android:latest

ENV GOPATH /go
ENV PATH ${PATH}:${GOPATH}/bin:/usr/local/go/bin

COPY golang.sh /dockerfiles/
RUN bash /dockerfiles/golang.sh

COPY golang_gomobile.sh /dockerfiles/
RUN bash /dockerfiles/golang_gomobile.sh

RUN rm -r /dockerfiles
