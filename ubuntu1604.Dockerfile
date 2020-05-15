FROM ubuntu:xenial

COPY ubuntu1604.sh /dockerfiles/
RUN bash /dockerfiles/ubuntu1604.sh && rm -r /dockerfiles

