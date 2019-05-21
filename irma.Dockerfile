FROM privacybydesign/debian:latest

COPY irma.sh /dockerfiles/
RUN bash /dockerfiles/irma.sh && rm -r /dockerfiles