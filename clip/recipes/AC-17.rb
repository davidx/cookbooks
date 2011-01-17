# AC-17: Remote Access
# Kickstart Actions:

# AC-17(1)
# Kickstart Actions:
environment({'PATH' => "/usr/bin:/usr/sbin:/bin:sbin"})

# AC-17(2)
# Kickstart Actions:

execute "AC-17" do
  ## (GEN005500: CAT I) (Previously - G701) The IAO and SA will ensure SSH
  ## Protocol version 1 is not used, nor will Protocol version 1 compatibility
  ## mode be used.
  # default path for following execs
  environment({'PATH' => "/usr/bin:/usr/sbin:/bin:sbin"})

  command "sed -i '/^Protocol/ c\Protocol 2' /etc/ssh/sshd_config"
end

edit_file "/etc/ssh/sshd_config" do
  append_if_no_such_line "Ciphers aes256-cbc,aes192-cbc,blowfish-cbc,cast128-cbc,aes128-cbc,3des-cbc"
  append_if_no_such_line('Protocol 2')
end


# AC-17(3)
# Kickstart Actions:

# AC-17(4)
# Kickstart Actions:

# AC-17(5)
# Kickstart Actions:
# Implemented in AC-17(2)

## (GEN006620: CAT II) The SA will ensure an access control program (e.g.,
## TCP_WRAPPERS) hosts.deny and hosts.allow files (or equivalent) are used to
## grant or deny system access to specific hosts.
file "/etc/hosts.deny" do
  content "ALL:ALL\n"
end


# AC-17(6)
# Kickstart Actions:

# AC-17(7)
# Kickstart Actions:
## (GEN001020: CAT II) The IAO will enforce users requiring root privileges to
## log on to their personal account and invoke the /bin/su - command to switch
## user to root.
# Configure sshd and login to consult pam_access.so

execute "sshd pam" do

  # default path for following execs
  environment({'PATH' => "/usr/bin:/usr/sbin:/bin:sbin"})

  command "sed -i '/^account.*auth$/ a\account\t\trequired\tpam_access.so' /etc/pam.d/sshd"
  only_if system "test `grep -c pam_access.so /etc/pam.d/sshd` -eq 0"
end

execute "login pam" do

  command "sed -i '/^account.*auth$/ a\account\t\trequired\tpam_access.so' /etc/pam.d/login"
  only_if system "test `grep -c pam_access.so /etc/pam.d/login` -eq 0"
end

edit_file "/etc/security/access.conf" do
  append_if_no_such_line("-:ALL EXCEPT users :ALL")
end


user "clipuser" do
  #FIXME check require => Class["ia-2::main"],
  groups ["users", "wheel"]
  manage_home true
  # supports a password option but it must be
  # the hashed password

#			"puppet":
#			ensure => absent;
#	}
end


file "/var/lib/puppet" do
  owner "root"
  group "root"
end
file "/var/log/puppet" do
  owner "root"
  group "root"
end
file "/var/run/puppet" do
  owner "root"
  group "root"
end

#FIXME
# seems to have a problem with the pipe in the command
#exec { "echo 123)(*qweASD" | passwd --stdin clipuser":
#	path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
#	subscribe => User["clipuser"],
#	refreshonly => true;
#}

## (GEN001120: CAT II) (Previously - G500) The SA will configure the
## encryption program for direct root access only from the system console.
execute "root_only" do
  command "sed -i '/^#PermitRootLogin/ c\PermitRootLogin no' /etc/ssh/sshd_config"
end
