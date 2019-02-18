FROM privacybydesign/debian:latest

COPY node.sh /dockerfiles/
RUN bash /dockerfiles/node.sh && rm -r /dockerfiles