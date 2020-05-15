FROM privacybydesign/debian:latest

COPY meteor.sh /dockerfiles/
RUN bash /dockerfiles/meteor.sh && rm -r /dockerfiles

RUN useradd -ms /bin/bash meteor
USER meteor

RUN meteor --version
