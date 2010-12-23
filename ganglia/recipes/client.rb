
portage_package "sys-cluster/ganglia" do
  action :install
end
service "gmond" do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
end
template "/etc/ganglia/gmond.conf" do
  source "gmond.conf.erb"
  notifies :restart, "service[gmond]"
end