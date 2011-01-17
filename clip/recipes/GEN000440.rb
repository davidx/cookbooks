## (GEN000440: CAT II) (Previously - G012) The SA will ensure all logon attempts (both
## successful and unsuccessful) are logged to a system log file.

edit_file "/etc/syslog.conf" do
  append_if_no_such_line "auth.*							/var/log/authlog"
end
