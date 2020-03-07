FROM privacybydesign/golang:latest

COPY golang_sql.sh /dockerfiles/
RUN bash /dockerfiles/golang_sql.sh && rm -r /dockerfiles

CMD service mysql start && tail -F /var/log/mysql/error.log
