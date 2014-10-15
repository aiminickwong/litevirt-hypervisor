#! /bin/bash

# `buildenv.sh` is a script used to prepare build environment for building iso.

# check os type
os_type=`cat /etc/issue | head -1 |awk '{print $1}'`
if [ "$os_type" != "CentOS" -a "$os_type" != "Fedora" ];then
  echo "Sorry, not support this OS by now."
  exit 1
fi

# prepare repo for OS
if [ "$os_type" == "CentOS" ];then
  wget http://mirrors.163.com/.help/CentOS6-Base-163.repo
  if [ ! -f CentOS6-Base-163.repo ];then
    echo "download repo file failed"
    exit 1
  fi
  mv CentOS6-Base-163.repo /etc/yum.repos.d/

  wget http://ftp.sjtu.edu.cn/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
  if [ ! -f epel-release-6-8.noarch.rpm ];then
    echo "download repo file failed"
    exit 1
  fi
  rpm -ivh epel-release-6-8.noarch.rpm
  rm -rf epel-release-6-8.noarch.rpm

  wget http://openstack.wiaapp.com/download/openstack-ovirt-node-deps.repo
  if [ ! -f openstack-ovirt-node-deps.repo ];then
    echo "download repo file failed"
    exit 1
  fi
  mv openstack-ovirt-node-deps.repo /etc/yum.repos.d/ovirt-node-deps.repo

elif [ "$os_type" == "Fedora" ];then
  wget http://mirrors.163.com/.help/fedora-163.repo
  if [ ! -f fedora-163.repo ];then
    echo "download repo file failed"
    exit 1
  fi
  mv fedora-163.repo /etc/yum.repos.d/

  wget http://mirrors.163.com/.help/fedora-updates-163.repo
  if [ ! -f fedora-updates-163.repo ];then
    echo "download repo file failed"
    exit 1
  fi
  mv fedora-updates-163.repo /etc/yum.repos.d/
fi
yum clean all

# install dependent packages for building iso.
pkgs="gcc make autoconf automake gettext-devel git python-cherrypy python-cheetah libxml2-python python-imaging PyPAM m2crypto python-jsonschema rpm-build python-psutil python-ethtool sos python-ipaddr python-lxml nfs-utils iscsi-initiator-utils libxslt pyparted nginx python-unittest2 python-ordereddict hardlink pykickstart createrepo livecd-tools appliance-tools appliance-tools-minimizer policycoreutils-python"

for pkg in $pkgs
do
  yum install -y $pkg
done
