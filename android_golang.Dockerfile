FROM privacybydesign/android:latest

ENV GOPATH /go
ENV PATH ${PATH}:${GOPATH}/bin:/usr/local/go/bin

COPY golang.sh /dockerfiles/
RUN bash /dockerfiles/golang.sh && rm -r /dockerfiles

