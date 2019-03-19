FROM privacybydesign/debian:latest

COPY jdk8.sh /dockerfiles/
RUN bash /dockerfiles/jdk8.sh && rm -r /dockerfiles