FROM privacybydesign/golang:latest

ENV FLUTTER_VERSION="2.10.1"
ENV FLUTTER_CHANNEL="stable"
ENV FLUTTER_CHECKSUM="ad27f0720943576aef265d748fb141c805a6821776158c6b9648189ef44ee786"

LABEL version="go$GO_VERSION-flutter$FLUTTER_VERSION"

ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:${FLUTTER_HOME}/bin

COPY flutter.sh /dockerfiles/
RUN bash /dockerfiles/flutter.sh

COPY flutter_hover.sh /dockerfiles/
RUN bash /dockerfiles/flutter_hover.sh

RUN rm -r /dockerfiles
