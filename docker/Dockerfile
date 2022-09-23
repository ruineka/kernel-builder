#Dockerfile for building the linux kernel
#Based on Arch

FROM archlinux:base-devel
MAINTAINER Wouter Wijsman

#set working dir, you'll have to mount something yourself here
WORKDIR /root/output

# Build pikaur packages as the 'build' user
ENV BUILD_USER "build"

ENV GNUPGHOME  "/etc/pacman.d/gnupg"

RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    useradd build -G wheel -m
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN pacman --noconfirm -Sy git base-devel

ADD output /root/output
