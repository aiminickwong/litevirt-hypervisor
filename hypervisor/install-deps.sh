#! /bin/bash

# `buildenv.sh` is a script used to prepare build environment for building iso.

# check os type
if [ ! -f /etc/centos-release ];then
  echo "Sorry, not support this OS by now."
  exit 1
fi

# prepare repo for OS
mkdir -p /tmp/yum.repos.d
mv -f /etc/yum.repos.d/* /tmp/yum.repos.d/

repos="CentOS-163.repo epel.repo litevirt-hypervisor.repo"
remote_repo_path="http://www.wiaapp.cn/downloads/litevirt/repo/yum.repos.d/"
for repo in $repos
do
  rst=`curl -s -o /dev/null -w "%{http_code}" $remote_repo_path$repo` 
  if [ $rst -ne 200 ];then
    echo "download repo $remote_repo_path$repo failed"
    exit 1
  fi

  curl -O $remote_repo_path$repo
  if [ ! -f $repo ];then
    echo "download repo $remote_repo_path$repo failed"
    exit 1
  fi
  mv $repo /etc/yum.repos.d/
done

# install dependent packages for building iso.
pkgs="gcc make autoconf automake gettext-devel git python-cherrypy python-cheetah libxml2-python python-imaging \
PyPAM m2crypto python-jsonschema rpm-build python-psutil python-ethtool sos python-ipaddr python-lxml nfs-utils \
iscsi-initiator-utils libxslt pyparted nginx python-unittest2 python-ordereddict hardlink pykickstart createrepo \
livecd-tools appliance-tools appliance-tools-minimizer policycoreutils-python selinux-policy-devel grub2-efi"
yum install -y $pkgs
