#Building Certifiable Linux Integration Platform
#=================================================

#== RPM Build Steps ==

# The following steps assume a standard RHEL5.3 installation

# Use yum to install the following packages and their dependencies:


packages = node[:clip][:redhat][:install][:packages]

packages.each do |package_name|
  redhat_package package_name do
    action :install
  end
end

platform  = node[:clip][:platform]
mount_dir = "/mnt/#{platform}"

directory mount_dir do
  action :create
end

mount mount_dir do
  device '/dev/cdrom'
end


#* Checkout clip

script "update with clip rpms" do

  arch = node[:kernel][:machine]
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    svn co http://oss.tresys.com/repos/clip/trunk/#{platform.upcase} clip
    cd clip/selinux-usr

    make libsepol-rpm
	  rpm -Uvh --force rpm/RPMS/#{arch}/{libsepol,libsepol-devel}-1.16.14-1.#{arch}.rpm

    make libselinux-rpm
	  rpm -Uvh --force --nodeps rpm/RPMS/#{arch}/{libselinux,libselinux-devel,libselinux-python,libselinux-utils}-1.34.15-1.#{arch}.rpm

    make libsemanage-rpm
    rpm -Uvh --force rpm/RPMS/#{arch}/{libsemanage,libsemanage-devel}-1.10.9-1.#{arch}.rpm

    make policycoreutils-rpm
    rpm -Uvh --force rpm/RPMS/#{arch}/{policycoreutils,policycoreutils-newrole,policycoreutils-gui}-1.34.16-1.#{arch}.rpm

    make checkpolicy-rpm
    rpm -Uvh --force rpm/RPMS/#{arch}/checkpolicy-1.34.7-1.#{arch}.rpm

# * Build clip, clip puppet, and clip selinux policy

    cd ../build

    make clip-rpm selinux-policy-clip-rpm puppet-rpm

#  * Build patched pam libraries

    cd ../pam
    make pam-rpm

#  * Build patched IPTables

    cd ../iptables
    make iptables-rpm

#  * You will need to install the following rpms on the production system
#  * (See Installing Certifiable Linux Integration Platform
#  *  below for details on installing the production system):

    rpm -Uvh --force clip/RPM/clip-3.1-1.#{arch}.rpm
    rpm -Uvh --force clip/RPM/selinux-policy-clip-3.1-1.noarch.rpm
    rpm -Uvh --force clip/RPM/clip-puppet-3.1-1.rpm
    rpm -Uvh --force clip/RPM/libsepol-1.16.14-1.#{arch}.rpm
    rpm -Uvh --force clip/RPM/libselinux-1.34.15-1.#{arch}.rpm
    rpm -Uvh --force clip/RPM/libselinux-python-1.34.15-1.#{arch}.rpm
    rpm -Uvh --force clip/RPM/libsemanage-1.10.9-1.#{arch}.rpm
    rpm -Uvh --force clip/RPM/policycoreutils-1.34.16-1.#{arch}.rpm
    rpm -Uvh --force clip/RPM/policycoreutils-newrole-1.34.16-1.#{arch}.rpm
    rpm -Uvh --force clip/RPM/checkpolicy-1.34.7-1.#{arch}.rpm
    rpm -Uvh --force clip/RPM/pam-0.99.6.2-4.1.#{arch}.rpm
    rpm -Uvh --force clip/RPM/iptables-1.3.5-4.99.el5.#{arch}.rpm

#  * To patch ovaldi download download the ovaldi-5.5.25 source from
#  * http://sourceforge.net/projects/ovaldi/files/. Follow the instructions
#  * in that source tree to obtain the necessary packages to build. Copy the patches
#  * found in the clip/ovaldi directory to the ovaldi-5.5.25-src directory
#
#    patch -p1 < LinuxFileFinder.patch
#    patch -p1 < LinuxMakefile.patch
#    patch -p1 < password-shadow-probe.patch
#    patch -p1 < Spec_x86_64.patch
#
#  * Follow the build instructions provided by ovaldi

  EOH
end


* Update the selinux toolchain

Note : In the follow commands, replace $ARCH with your system architecture (either i386 or x86_64)


=== Building a CLIP ISO ===

* Install EPEL Repository

rpm -Uvh http ://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-3.noarch.rpm

* Install & patch revisor

yum install revisor
patch -d /usr/ lib/python2 .4/site-packages/revisor/ -p1 < revisor/revisor-rhel5-createrepo.patch

* Mount the RHEL5 dvd

mkdir /mnt/ rhel-iso
mount /dev/ cdrom /mnt/rhel-iso

or
    if you have an iso

      mount -o loop rhel-server-5.3-$BASEARCH-dvd.iso /mnt/ rhel-iso

      * Build the ISO

      make -C build iso

      Installing Certifiable Linux Integration Platform
      =================================================

          === Installing the CLIP 3.3 .2 RHEL 5.3 Base System ===
                                                           The default CLIP installation requires access to the Redhat EPEL and Tresys
      OSS yum repositories.If your environment does not have internet access you
      will have to edit the kickstart file to remove the yum access and install
      the packages by hand as in the 3.3 .0 and earlier CLIP versions.

                                                                 To begin
                                                                      installation of the Certified Linux Integration Platform, first obtain
                                                                      installation discs for Red Hat Enterprise Linux 5.3, Server.

                                                                          Next,                                       obtain the kickstart file (clip.ks) from
                                                                                           http ://oss.tresys.com/projects/clip/wiki/DownloadRelease #RHEL5.3. This file
                                                                                           supplies Red Hat 's installer, anaconda, with various install-time parameters.
The local copy of the generic kickstart file needs to have the following edits
made to it:

	1. The partitioning information needs to be defined for the specific systems
	   hardware requirements. Partition sizes are specified in megabytes sizes.
	2. If the kickstart file is accessed via the network-based method, note that
	   the client system must obtain its TCP/IP configuration information before it
	   is able to resolve hostnames. This can be done by including the commented
	   out line at the top of the kickstart script:

		# network --bootproto=dhcp

	If this is not present and a network-based installation method is chosen,
	the server on which the kickstart script resides must be referred to
	directly by IP address.

The kickstart script is supplied to the Linux kernel as a boot parameter. The
script can be conveyed to the kernel in various ways, either via a network
connection (HTTP, FTP/TFTP and NFS are supported) or locally via floppy,
harddisk or CDROM.

Boot from Disc 1 of the RHEL5.3 Server installation discs, supplying the
kickstart script as a kernel boot parameter:

Accessing the kickstart file:

	boot> linux ks=http://someserver/clip.ks

	- or -

	boot> linux ks=http://ipaddr/clip.ks

	- or -

	boot> linux ks=<device name>:/clip.ks

This will initiate the installation process. The user will choose appropriate
values for settings prompted for by anaconda. At this point, anaconda will
install the operating system and a few packages. At the end of the
installation, you will be prompted to create a password for the ' root ' and
' clipuser ' users.  Once this is complete, a reboot will be necessary.

After rebooting, login to the system with the ' clipuser ' account and the
password you created. (The user name should be entered without quotes.)

Once this account has been authenticated, you will need to switch to the
superuser account via the su command to complete the remaining steps of the
CLIP installation. The password for this account is the root password you
created.


=== Installing Packages ===

CLIP installs an IPTables package update that supports per packet labeling
using SECMARK. A detailed description of SECMARK is available at:
http://james-morris.livejournal.com/11010.html.

If you wish to use SECMARK you must turn off the compat_net option that is
enabled by the clip kickstart file. You can enable this at runtime by using the
command

	echo "0" > /selinux/compat_net

In order to make this change persistent across reboots edit the file
/boot/grub/grub.conf and set selinux_compat_net=0

Finally packets can be labeled using rules such as:

	iptables -A INPUT -t mangle -p tcp --dport 21 -j SECMARK --selctx system_u:object_r:ftp_client_packet_t:s0
	iptables -A INPUT -t mangle -m state --state RELATED,ESTABLISHED -j CONNSECMARK --restore

The first rule will label all tcp packets received on port 21
system_u:object_r:ftp_client_packet_t:s0. The second rule ensures that all
further packets that are part of initial connection will keep that label. All
rules must be added to the mangle table. If a rule has an invalid context
IPTables will return a very bad error code that is not descriptive. This
problem exists because of the way that IPTables returns errors and was not
easily solvable as part of our back port.

Edit /etc/selinux/config and set the SELINUX=enforcing

reboot

After rebooting, login to the system with the ' clipuser ' account and password.

Once this account has been authenticated, the user will be assigned a context
of root:sysadm_r:sysadm_t. The user will still need to switch to the superuser
account via the su command to perform administrative actions. These steps are
necessary to meet auditing requirements specified by DCID 6/3.


=== Configuring System Services ===

In order to minimize attack vectors into the system, the default installation
of CLIP enables a minimal subset of services. The following services will be
enabled when booted into runlevel 3 (the default for CLIP):

	atd auditd crond iptables network syslog sysstat

An administrator who wishes to enable additional services should consider
enabling the SELinux policy module(s) associated with the services being added.
The chkconfig(8) utility should be used to add or remove services from a
particular runlevel.

=== Additional Operational Considerations ===

The CLIP installation process also defines a password for the bootloader, as
required by the DCID 6/3, which is ' 123)(*qweASD '.
