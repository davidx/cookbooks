file "/etc/syslog.conf" do
  ## (GEN005400: CAT II) (Previously - G656) The SA will ensure the owner of the
  ## /etc/syslog.conf file is root with permissions of 640, or more restrictive.
  owner => "root"
  mode => 640

  ## (GEN005420: CAT II) (Previously - G657) The SA will ensure the group owner
  ## of the /etc/syslog.conf file is root, sys, or bin.
  group => "root"
end


