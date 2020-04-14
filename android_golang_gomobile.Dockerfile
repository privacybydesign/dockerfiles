FROM privacybydesign/android_golang:latest

COPY golang_gomobile.sh /dockerfiles/
RUN bash /dockerfiles/golang_gomobile.sh && rm -r /dockerfiles
