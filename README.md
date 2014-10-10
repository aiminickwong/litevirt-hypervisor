litevirt-hypervisor
===============

Based on projects of ovirt-node and kimchi, provides capability to fastly construct a virtualization management environment

1. Install a host with CentOS 6.5

2. Git clone this project and switch branch to hypervisor

3. Construct compiler environment 

   cd hypervisor

   sh buildenv.sh

4. Compile iso

   sh autobuild.sh
   
5. Install iso

   The procedure is the same as installing ovirt-node, For the first boot from hard disk, please config static ip

6. Use kimchi
   
   Using admin account to login into kimchi, the URL is http://IP:8000/, then you can upload image and create virtual machine

