# AU-2: Auditable Events
# Kickstart Actions:

# AU-2(1)
# Kickstart Actions:
## (GEN002660: CAT II) (Previously - G093) The SA will configure and implement
## auditing.

service "auditd" do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
end

file "/etc/audit/audit.rules" do
  #FIXME copy files

  content template("AU-2/audit.rules")
  mode 640
  notifies :reload, "service[auditd]"
end
file "/etc/audit/auditd.conf" do
  #FIXME copy files
  source "/etc/puppet/modules/AU-2/files/auditd.conf";
  notifies :reload, "service[auditd]"
end

## (GEN002680: CAT II) (Previously - G094) The SA will ensure audit data files
## and directories will be readable only by personnel authorized by the IAO.

directory "/var/log/audit" do
  mode 700,
  notifies :reload, "service[auditd]"

end
# FIXME		require  Class[ "ac-3::p4" ];

## (GEN002700: CAT I) (Previously - G095) The SA will ensure audit data files
## have permissions of 640, or more restrictive.
file "/var/log/audit/audit.log" do
  action :create
  mode 640
  # audit rules permissions implemented above
end


# AU-2(2)
# Kickstart Actions:

# AU-2(3)
# Kickstart Actions: None - PROCEDURAL REQUIREMENT

# AU-2(4)
# Kickstart Actions:

# Implemented in AU-2(1)

# AU-2(5)
# Kickstart Actions:

# AU-2(6)
# Kickstart Actions:

# AU-2(7)
# Kickstart Actions:

# AU-2(8)
# Kickstart Actions:

# AU-2(9)
# Kickstart Actions:

