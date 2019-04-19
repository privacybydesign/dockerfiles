FROM privacybydesign/golang:latest as builder

COPY buildah-build.sh podman-build.sh /dockerfiles/
RUN bash /dockerfiles/buildah-build.sh
RUN bash /dockerfiles/podman-build.sh

FROM privacybydesign/debian:latest

COPY --from=builder /usr/bin/buildah /usr/bin/podman /usr/bin/runc /usr/bin/
COPY --from=builder /usr/libexec/podman /usr/libexec/cni /usr/bin/libexec/

COPY buildah.sh podman.sh /dockerfiles/
RUN bash /dockerfiles/buildah.sh
RUN bash /dockerfiles/podman.sh
RUN rm -r /dockerfiles