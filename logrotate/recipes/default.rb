portage_package "logrotate" do
  action :install
end

template "/etc/logrotate.conf" do
  source "etc/logrotate.conf.erb"
end

template "/etc/logrotate.d/rails" do
  source "etc/logrotate.d/rails.erb"
end

templace "/etc/cron.daily/logrotate.cron" do
   source "etc/cron.daily/logrotate.cron.erb"
end