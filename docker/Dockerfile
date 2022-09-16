#Dockerfile for building the linux kernel
#Based on Arch

FROM archlinux:base-devel
MAINTAINER Wouter Wijsman

#set working dir, you'll have to mount something yourself here
WORKDIR /root/kernel-builder

# Build pikaur packages as the 'build' user
ENV BUILD_USER "build"

ENV GNUPGHOME  "/etc/pacman.d/gnupg"

#Copy archiso files from this git repo
ADD kernel-builder /root/kernel-builder
