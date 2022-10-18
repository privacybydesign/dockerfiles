FROM privacybydesign/debian:latest

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

COPY keyrings/cloud.google.gpg /usr/share/keyrings/cloud.google.gpg

RUN apt-get update
RUN apt-get -y --no-install-recommends install google-cloud-cli
