FROM privacybydesign/golang_dep:latest

COPY golang_mobile.sh /dockerfiles/
RUN bash /dockerfiles/golang_mobile.sh && rm -r /dockerfiles