portage_package "mysql-proxy" do
  action :install
end

service "mysql-proxy" do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
end
template "/etc/mysql/mysql-proxy.cnf" do
  source "mysql-proxy.cnf.erb"
  notifies :reload, "service[mysql-proxy]"  
end