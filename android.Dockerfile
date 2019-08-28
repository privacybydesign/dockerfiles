FROM privacybydesign/debian:latest

ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_NDK_HOME /opt/android-sdk/ndk-bundle
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_NDK_HOME}

COPY . /dockerfiles

RUN bash /dockerfiles/android.sh

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN bash /dockerfiles/golang.sh
RUN bash /dockerfiles/golang_dep.sh
RUN bash /dockerfiles/golang_dep_mobile.sh

RUN bash /dockerfiles/node.sh
RUN bash /dockerfiles/node_yarn.sh

RUN rm -r /dockerfiles
