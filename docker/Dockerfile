#Dockerfile for building the linux kernel
#Based on Arch

FROM archlinux:base-devel
MAINTAINER Wouter Wijsman

#set working dir, you'll have to mount something yourself here
WORKDIR /root/output

# Build pikaur packages as the 'build' user
ENV BUILD_USER "build"

ENV GNUPGHOME  "/etc/pacman.d/gnupg"

RUN useradd --shell=/bin/false build && usermod -L build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN su - build -c "mkdir /build/home"
RUN su - build -c "git clone -b orientation-dmi-fixes https://github.com/ruineka/linux.git /tmp/linux" && \
    su - build -c "cd /tmp/linux && makepkg -f"

ADD output /root/output
