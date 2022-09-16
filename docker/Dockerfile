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
USER root
RUN pacman --noconfirm -Sy git base-devel
USER build
RUN makepkg -si /root/output/PKGBUILD

ADD output /root/output
