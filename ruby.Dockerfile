FROM privacybydesign/debian:latest

COPY ruby.sh /dockerfiles/
RUN bash /dockerfiles/ruby.sh && rm -r /dockerfiles