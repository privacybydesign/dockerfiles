FROM privacybydesign/debian:latest

COPY jdk11.sh /dockerfiles/
RUN bash /dockerfiles/jdk11.sh && rm -r /dockerfiles
