#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "$(basename $0) must be run as root"
	exit 1
fi

# get the directory of this script
work_dir="$(realpath $0|rev|cut -d '/' -f2-|rev)"

# configuration variables for the iso
output_dir="${work_dir}/output"

cd ${output_dir}
ls -a
su - build -c "mkdir /tmp/kernel-builder/"
cp PKGBUILD /tmp/kernel-builder/
cp config /tmp/kernel-builder/
cd /tmp/kernel-builder/

su - build -c "PKGDEST=/tmp/kernel-builder makepkg -f PKGBUILD"

# allow git command to work
git config --global --add safe.directory "${work_dir}"

KERNEL=`ls ${output_dir}/linux-mainline-6*`
KERNEL_HEADERS=`ls ${output_dir}/linux-mainline-headers*`
KERNEL_DOCS=`ls ${output_dir}/linux-mainline-docs*`

pushd ${output_dir}

popd

echo "::set-output name=kernel-headers::${KERNEL_HEADERS}"
echo "::set-output name=kernel::${KERNEL}"
echo "::set-output name=kernel-docs::${KERNEL_DOCS}"
