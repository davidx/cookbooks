
portage_package "sys-cluster/ganglia" do
  action :install
end
template "/etc/ganglia/gmetad.conf" do
  source "gmetad.conf.erb"
  notifies :restart, "service[gmetad]"
end
service "gmetad" do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
end
