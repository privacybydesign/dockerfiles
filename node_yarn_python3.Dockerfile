FROM privacybydesign/node_yarn:latest

COPY python3.sh /dockerfiles/
RUN bash /dockerfiles/python3.sh && rm -r /dockerfiles
