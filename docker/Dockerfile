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
RUN pacman --noconfirm -Sy git base-devel
RUN mkdir /home/build
RUN chmod 777 /home/build
RUN git clone https://github.com/ruineka/linux.git /home/build
RUN su - build -c "cd /home/build/linux && makepkg -f"
RUN cp -r /home/build/linux* /root/output

ADD output /root/output
