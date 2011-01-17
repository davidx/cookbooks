# AC-8: System Use Notification
# Kickstart Actions:

## (GEN000400: CAT II) (Previously - G010) The SA will ensure a logon-warning banner is
## displayed on all devices and sessions at the initial logon.
template "/etc/issue" do
  source "issue"
end

# default path for following execs
environment({'PATH' => "/usr/bin:/usr/sbin:/bin:sbin"})

execute "logon_warning_banner" do
  command "sed -i '/^#Banner/ c\Banner /etc/issue' /etc/ssh/sshd_config"
end


# handle graphical logins
execute "graphical_login_warning_banner" do
  cwd File.dirname(__FILE__) + '/../files/default'
  command "sed -i -f Default.sed /etc/gdm/PreSession/Default"
  not_if "grep -q 'zenity.*/etc/issue' /etc/gdm/PreSession/Default"
end
