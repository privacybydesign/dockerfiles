FROM privacybydesign/golang:latest as builder

COPY buildah-build.sh /dockerfiles/
RUN bash /dockerfiles/buildah-build.sh && rm -r /dockerfiles

FROM privacybydesign/debian:latest

COPY --from=builder /go/bin/buildah /usr/local/bin/buildah

COPY buildah.sh /dockerfiles/
RUN bash /dockerfiles/buildah.sh && rm -r /dockerfiles
