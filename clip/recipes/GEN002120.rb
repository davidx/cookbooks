## (GEN002120: CAT II) (Previously - G069) The SA will ensure the /etc/shells
## (or equivalent) file exits.
template "/etc/shells" do
  source "/etc/puppet/modules/GEN002120/files/shells"
end

## (GEN002160: CAT I) (Previously - G072) The SA will ensure no shell has the
## suid bit set.
## (GEN002180: CAT II) (Previously - G073) The SA will ensure no shell has the
## sgid bit set.
## (GEN002200: CAT II) (Previously - G074) The SA will ensure the owner of all
## shells is root or bin.
## (GEN002220: CAT II) (Previously - G075) The SA will ensure all shells
## (excluding /dev/null and sdshell) have permissions of 755 or more
## restrictive.
file "/bin/sh" do
  mode 755
  owner "root"
end
file "/bin/bash" do
  mode 755
  owner "root"
end
file "/sbin/nologin" do
  mode 755
  owner "root"
end
file "/bin/tcsh" do
  mode 755
  owner "root"
end
file "/bin/csh" do
  mode 755
  owner "root"
end
file "/bin/ksh" do
  mode 755
  owner "root"
end
