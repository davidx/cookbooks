## (GEN003040: CAT II) The SA will ensure the owner of crontabs is root or the
## crontab creator.
## (GEN003080: CAT II) (Previously - G205) The SA will ensure crontabs have
## permissions of 600, or more restrictive (700 for some Linux crontabs, which
## is detailed in the UNIX Checklist).
file "/etc/cron.daily" do
  recursive true
  owner "root"
  mode 700
end

file "/etc/cron.hourly" do
  recursive true
  owner "root"
  mode 700
end

file "/etc/cron.weekly" do
  recursive true
  owner "root"
  mode 700
end

file "/etc/cron.monthly" do
  recursive true
  owner "root"
  mode 700
end

file "/etc/cron.d" do
  recursive true
  owner "root"
  mode 600
end

file "/var/spool/cron" do
  recursive true
  owner "root"
  mode 600
end

file "/etc/crontab" do
  mode 600
end

## (GEN003100: CAT II) (Previously - G206) The SA will ensure cron and crontab
## directories have permissions of 755, or more restrictive.
## (GEN003120: CAT II) (Previously - G207) The SA will ensure the owner of the
## cron and crontab directories is root or bin.
## (GEN003140: CAT II) (Previously - G208) The SA will ensure the group owner
## of the cron and crontab directories is root, sys, or bin.


execute "etc_cron_permissions" do
  command "find /etc/cron.* -type d -exec chmod 755 '{}' \;"
end

execute "spool_cron_permissions" do
  command "chmod 755 /var/spool/cron;"
end