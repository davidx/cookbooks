template "/etc/mysql/mysql-proxy.cnf" do
  source "mysql-proxy.cnf.erb"
  notifies :restart, "service[mysql-proxy]"  
end
template "/etc/conf.d/mysql-proxy" do
  source "mysql-proxy.erb"
  notifies :restart, "service[mysql-proxy]"
end
service "mysql-proxy" do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true
end

