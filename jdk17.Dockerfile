FROM privacybydesign/debian:latest

COPY jdk17.sh /dockerfiles/
RUN bash /dockerfiles/jdk17.sh && rm -r /dockerfiles
