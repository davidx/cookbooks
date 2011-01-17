## (GEN002860: CAT II) (Previously - G674) The SA and/or IAO will ensure old
## audit logs are closed and new audit logs are started daily.
cookbook_file "/etc/logrotate.d/audit" do
  source "audit.logrotate"
end
