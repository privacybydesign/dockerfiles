FROM privacybydesign/android_golang_dep_mobile:latest

COPY node.sh /dockerfiles/
RUN bash /dockerfiles/node.sh

COPY node_yarn.sh /dockerfiles/
RUN bash /dockerfiles/node_yarn.sh

RUN rm -r /dockerfiles
