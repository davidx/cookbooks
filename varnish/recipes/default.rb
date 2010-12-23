portage_package "varnish" do
  action :install
end

service "varnishd" do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true
end

directory "/etc/varnish" do
  action :create
end

template "/etc/varnish/default.vcl" do
  source "default.vcl.erb"
  notifies :restart, "service[varnishd]"
end
template "/etc/conf.d/varnishd" do
  source "varnishd.erb"
  notifies :restart, "service[varnishd]"
end