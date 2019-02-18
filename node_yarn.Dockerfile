FROM privacybydesign/node:latest

COPY node_yarn.sh /dockerfiles/
RUN bash /dockerfiles/node_yarn.sh && rm -r /dockerfiles