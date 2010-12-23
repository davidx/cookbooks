template "/etc/pf.conf" do
  source "pf.conf.erb"
  mode 0644
end