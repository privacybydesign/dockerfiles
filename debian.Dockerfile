FROM scratch

ADD debian-rootfs.tar.xz /

COPY debian.sh /dockerfiles/
RUN bash /dockerfiles/debian.sh && rm -r /dockerfiles

CMD ["bash"]
