FROM privacybydesign/debian:latest

ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_NDK_HOME /opt/android-sdk/ndk-bundle
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_NDK_HOME}

COPY android.sh /dockerfiles/
RUN bash /dockerfiles/android.sh && rm -r /dockerfiles
