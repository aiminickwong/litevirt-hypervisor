#! /bin/bash

os_type=`cat /etc/issue | head -1 |awk '{print $1}'`

if [ "$os_type" != "Fedora" ];then
  wget http://mirrors.163.com/.help/CentOS6-Base-163.repo CentOS6-Base-163.repo
  mv CentOS6-Base-163.repo /etc/yum.repos.d/

  wget http://ftp.sjtu.edu.cn/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
  rpm -ivh epel-release-6-8.noarch.rpm
  rm -rf epel-release-6-8.noarch.rpm

  wget http://openstack.wiaapp.com/download/openstack-ovirt-node-deps.repo openstack-ovirt-node-deps.repo
  mv openstack-ovirt-node-deps.repo /etc/yum.repos.d/ 
fi


if [ "$os_type" != "Fedora" ];then
  wget http://mirrors.163.com/.help/fedora-163.repo
  mv fedora-163.repo /etc/yum.repos.d/

  wget http://mirrors.163.com/.help/fedora-updates-163.repo
  mv fedora-updates-163.repo /etc/yum.repos.d/
fi

yum clean all
