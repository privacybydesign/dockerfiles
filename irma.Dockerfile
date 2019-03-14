FROM privacybydesign/golang_dep:latest as builder
COPY irma.sh /dockerfiles/
RUN bash /dockerfiles/irma.sh && rm -r /dockerfiles

FROM privacybydesign/debian
COPY --from=builder /go/bin/irma /usr/local/bin/irma
CMD ["irma", "server"]
