FROM privacybydesign/golang:latest

COPY golang_dep.sh /dockerfiles/
RUN bash /dockerfiles/golang_dep.sh && rm -r /dockerfiles