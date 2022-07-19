# Dockerfiles
This repository contains the Dockerfiles for the `gitlab-ci.yml` files within the privacybydesign organization.

## Preliminaries
You need a working Docker setup in order to build the Dockerfiles locally. Below you can find an overview of possible tools for this.
* [Docker Engine](https://docs.docker.com/engine/) (Linux only)
* [Rancher Desktop](https://rancherdesktop.io/)
* [Docker Desktop](https://www.docker.com/products/docker-desktop/) (proprietary)

## Build
To build all Docerfiles, you can run the following script:

    ./build_all.sh

If you want to build a specific Dockerfile, you can do that in the following way.

1. Build our base image:

       ./debian-downloadrootfs.sh
       ./build_one.sh debian

2. Build other Dockerfiles based on the base image:

       ./build_one.sh golang

You can then run the Dockerfile like this:

    docker run -it privacybydesign/golang

## Debian keyrings

We pin the Debian GPG keys that we trust in the keyrings directory. The keys in that directory are already dearmored.

    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor > ./keyrings/cloud.google.gpg 
