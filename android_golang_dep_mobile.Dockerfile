FROM privacybydesign/android:latest

ENV GOPATH /go
ENV PATH ${PATH}:${GOPATH}/bin:/usr/local/go/bin

COPY golang.sh /dockerfiles/
RUN bash /dockerfiles/golang.sh

COPY golang_dep.sh /dockerfiles/
RUN bash /dockerfiles/golang_dep.sh

COPY golang_mobile.sh /dockerfiles/
RUN bash /dockerfiles/golang_mobile.sh

RUN rm -r /dockerfiles