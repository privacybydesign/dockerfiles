FROM privacybydesign/jdk11:latest

ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_NDK_HOME /opt/android-sdk/ndk/21.4.7075529
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_NDK_HOME}

COPY android.sh /dockerfiles/
RUN bash /dockerfiles/android.sh && rm -r /dockerfiles
