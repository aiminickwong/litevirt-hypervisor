#! /bin/bash

# `autobuild.sh` is a script used to building iso including Ovirt-Node and Kimchi.

# prepare tmp build directory
builddir="/tmp/tmp-"`date +%s`
mkdir -p $builddir
cd $builddir

# build ovirt-node
git clone https://github.com/litevirt/ovirt-node.git
cd ovirt-node
git checkout litevirt-hypervisor

# generate iso
./autobuild.sh
