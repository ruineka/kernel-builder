#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "$(basename $0) must be run as root"
	exit 1
fi

# get the directory of this script
work_dir="$(realpath $0|rev|cut -d '/' -f2-|rev)"

# configuration variables for the iso
output_dir="${work_dir}/output"

# create output directory if it doesn't exist yet
rm -rf "${output_dir}"
mkdir -p "${output_dir}"

https://github.com/ruineka/linux.git $output_dir

makepkg -si $output_dir/PKGBUILD

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
