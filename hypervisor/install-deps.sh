#! /bin/bash

# `buildenv.sh` is a script used to prepare build environment for building iso.

# check os type
if [ ! -f /etc/centos-release ];then
  echo "Sorry, not support this OS by now."
  exit 1
fi

# prepare repo for OS
curl -O http://www.wiaapp.cn/downloads/litevirt/repo/yum.repos.d/CentOS-163.repo 
if [ ! -f CentOS-163.repo ];then
  echo "download repo file failed"
  exit 1
fi
mv CentOS-163.repo /etc/yum.repos.d/CentOS-163.repo

curl -O http://www.wiaapp.cn/downloads/litevirt/repo/yum.repos.d/epel.repo
if [ ! -f epel.repo ];then
  echo "download repo file failed"
  exit 1
fi
mv epel.repo /etc/yum.repos.d/epel.repo

curl -O http://www.wiaapp.cn/downloads/litevirt/repo/yum.repos.d/litevirt-hypervisor.repo
if [ ! -f litevirt-hypervisor.repo ];then
  echo "download repo file failed"
  exit 1
fi
mv litevirt-hypervisor.repo /etc/yum.repos.d/litevirt-hypervisor.repo

# install dependent packages for building iso.
pkgs="gcc make autoconf automake gettext-devel git python-cherrypy python-cheetah libxml2-python python-imaging \
PyPAM m2crypto python-jsonschema rpm-build python-psutil python-ethtool sos python-ipaddr python-lxml nfs-utils \
iscsi-initiator-utils libxslt pyparted nginx python-unittest2 python-ordereddict hardlink pykickstart createrepo \
livecd-tools appliance-tools appliance-tools-minimizer policycoreutils-python selinux-policy-devel grub2-efi"
yum install -y $pkgs

