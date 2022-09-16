#!/bin/bash

# get the directory of this script
work_dir="$(realpath $0|rev|cut -d '/' -f2-|rev)"

# configuration variables for the build
dockerfile="${work_dir}/docker/Dockerfile"

# fetch latest base docker image
docker pull archlinux:base-devel

# build the docker container
docker build --no-cache -f "${dockerfile}" -t kernel-builder ${work_dir}

# make the container build the iso
exec docker run --privileged --rm -v ${work_dir}:/root/build -h kernel-builder kernel-builder ./build-kernel.sh
