FROM privacybydesign/golang:latest

ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:${FLUTTER_HOME}/bin

COPY flutter.sh /dockerfiles/
RUN bash /dockerfiles/flutter.sh

COPY flutter_hover.sh /dockerfiles/
RUN bash /dockerfiles/flutter_hover.sh

RUN rm -r /dockerfiles
