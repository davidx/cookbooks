

# files:
# hostname.em0 hostname.em1 hostname.rl0
# hostname.carp1 hostname.carp2 hostname.pfsync0 rc.conf.local

template "/etc/testprefix/hostname." + node[:loadbalancer][:ext_if][:name] do
  source "hostname.EXT_IF.erb"
  mode 0644
  variables(
      :ext_if => node[:loadbalancer][:ext_if]
    )

end
template "/etc/testprefix/hostname." + node[:loadbalancer][:int_if][:name] do
  source "hostname.INT_IF.erb"
  mode 0644
end
template "/etc/testprefix/hostname." + node[:loadbalancer][:pfsync_if][:name] do
  source "hostname.PFSYNC_IF.erb"
  mode 0644
end

template "/etc/testprefix/hostname.carp1" do
  source "hostname.carp1.erb"
  mode 0644
end

template "/etc/testprefix/hostname.carp1" do
  source "hostname.carp1.erb"
  mode 0644
end
template "/etc/testprefix/hostname.pfsync0" do
  source "hostname.pfsync0.erb"
  mode 0644
end
template "/etc/testprefix/hostname.pfsync0" do
  source "hostname.pfsync0.erb"
  mode 0644
end
template "/etc/testprefix/pf.conf" do
  source "pf.conf.erb"
  mode 0644
end
template "/etc/testprefix/relayd.conf" do
  source "relayd.conf.erb"
  mode 0644
  variables(
      :relayd => node[:loadbalancer][:relayd]
    )
end
#template "/etc/sysctl.conf" do
#    source "sysctl.conf.erb"
#    mode 0644
#end
#template "/etc/rc.conf.local" do
#    source "rc.conf.local.erb"
#    mode 0644
#end