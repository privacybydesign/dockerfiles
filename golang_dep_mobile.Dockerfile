FROM privacybydesign/golang_dep:latest

COPY golang_dep_mobile.sh /dockerfiles/
RUN bash /dockerfiles/golang_dep_mobile.sh && rm -r /dockerfiles