FROM privacybydesign/android_golang_dep_mobile:latest

ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:${FLUTTER_HOME}/bin

COPY android_flutter.sh /dockerfiles/
RUN bash /dockerfiles/android_flutter.sh && rm -r /dockerfiles
