portage_package "haproxy" do
  action :install
end

service "haproxy" do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
end

template "/etc/haproxy.cfg" do
  source "haproxy.cfg.erb"
  notifies :reload, "service[haproxy]"
end