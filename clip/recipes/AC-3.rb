# AC-3: Access Enforcement
# Kickstart Actions:

# AC-3(1)
# Kickstart Actions:
## (GEN002420: CAT II) (Previously - G086) The SA will ensure user filesystems,
## removable media, and remote filesystems will be mounted with the nosuid
## option.
environment({'PATH' => "/usr/bin:/usr/sbin:/bin:sbin"})

execute "acl_home" do

  # global defaults

  #nosuid, nodev, and acl on /home
  command "sed -i 's/\( \/home.*defaults\)/\1,nosuid,nodev,acl/' /etc/fstab"
  only_if system "test `grep ' \/home ' /etc/fstab | grep -c nosuid` -eq 0"
end
execute "acl_sys" do

  #nosuid and acl on /sys
  command "sed -i 's/\( \/sys.*defaults\)/\1,nosuid,acl/' /etc/fstab"
  only_if system "test `grep ' \/sys ' /etc/fstab | grep -c nosuid` -eq 0"
end
execute "acl_boot" do
  #nosuid and acl on /boot
  command "sed -i 's/\( \/boot.*defaults\)/\1,nosuid,acl/' /etc/fstab"
  only_if system "test `grep ' \/boot ' /etc/fstab | grep -c nosuid` -eq 0"
end
execute "acl_usr" do

  #nodev and acl on /usr
  command "sed -i 's/\( \/usr.*defaults\)/\1,nodev,acl/' /etc/fstab"
  only_if system "test `grep ' \/usr ' /etc/fstab | grep -c nodev` -eq 0"
end
execute "acl_usr_local" do

  #nodev and acl on /usr/local
  command "sed -i 's/\( \/usr\/local.*defaults\)/\1,nodev,acl/' /etc/fstab"
  only_if system "test `grep ' \/usr/local ' /etc/fstab | grep -c nodev` -eq 0"
end

# AC-3(2)
# Kickstart Actions:

# AC-3(3)
# Kickstart Actions:

# AC-3(4)
# Kickstart Actions:
execute "log_permissions" do
  ## (GEN001260: CAT II) (Previously - G037) The SA will ensure all system log
  ## files have permissions of 640, or more restrictive.

  # default path for following execs
  command "find /var/log/ -type f -exec chmod 640 '{}' \;"
end

### The following files are created with the wrong permissions when
##  the system first boots. To ensure they are granted the correct permissions
##  we will create them with puppet and assign all information. Reference GEN001260 failure.
file "/var/log/dmesg" do
  owner "root"
  group "root"
  mode 640;
end

file "/var/log/acpid" do
  owner "root"
  group "root"
  mode 640
end

file "/etc/init.d/sysstat" do
  content "AC-3/sysstat"
  mode 755
end

sa_path = "/usr/lib#{node[:kernel][:machine] == 'x86_64' ? '64' :''}/sa"

file "#{sa_path}/sa1" do
  content template("AC-3/sa1")
  mode 755
end

file "#{sa_path}/sa2" do
  content template("AC-3/sa2")
  mode 755
end

file "/etc/rc.d/rc.sysinit" do
  mode 640
end


## (GEN002980: CAT II) The SA will ensure the cron.allow
## file has permissions of 600, or more restrictive.
## (GEN003240: CAT II) The SA will ensure the owner and
## group owner of the cron.allow file is root.
file "/etc/cron.allow" do
  owner "root"
  group "root"
  mode 600
end
## (GEN003060: CAT II) The SA will ensure default system accounts (with the
## possible exception of root) will not be listed in the cron.allow file. If
## there is only a cron.deny file, the default accounts (with the possible
## exception of root) will be listed there.
# CLIP note: this is not needed for AC-3, but this STIG is
# added here due to prevent duplicate puppet resources.  See below
# for the cron.deny part of the STIG.
#              ensure file,
#                      content "root\n"
#              end

## (GEN003200: CAT II)  The SA will ensure the cron.deny
## file has permissions of 600, or more restrictive.
## (GEN003260: CAT II) The SA will ensure the owner and
## group owner of the cron.deny file is root.
file "/etc/cron.deny" do
  owner "root"
  group "root"
  mode 600

  ## (GEN003060: CAT II) The SA will ensure default system accounts (with the
  ## possible exception of root) will not be listed in the cron.allow file. If
  ## there is only a cron.deny file, the default accounts (with the possible
  ## exception of root) will be listed there.
  # CLIP note: this is not needed for AC-3, but this STIG is
  # added here due to prevent duplicate puppet resources.  See above
  # for the cron.allow part of the STIG.
  content system "/bin/awk" "-F:" "\$1 != \"root\" { print \$1 }" "/etc/passwd"
end

## (GEN003960: CAT II) (Previously - G631) The SA will ensure the owner of
## the traceroute command is root.
## (GEN003980: CAT II) (Previously - G632) The SA will ensure the group
## owner of the traceroute command is root, sys, or bin.
## (GEN004000: CAT II) (Previously - G633) The SA will ensure the traceroute
## command has permissions of 700, or more restrictive.
file "/bin/traceroute" do
  owner "root"
  group "root"
  mode 700
end

## (GEN006520: CAT II) (Previously - G189) The SA will ensure security tools
## and databases have permissions of 740, or more restrictive.
file "/etc/rc.d/init.d/iptables" do
  mode 740
end
file "/sbin/iptables" do
  mode 740
end
file "/usr/share/logwatch/scripts/services/iptables" do
  mode 740
end

          
