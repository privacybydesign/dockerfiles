FROM privacybydesign/debian:latest

COPY java.sh /dockerfiles/
RUN bash /dockerfiles/java.sh && rm -r /dockerfiles