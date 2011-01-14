

# files:
# hostname.em0 hostname.em1 hostname.rl0
# hostname.carp1 hostname.carp2 hostname.pfsync0 rc.conf.local

node[:loadbalancer][:interfaces].each do|interface_name|

  template "/etc/hostname.#{interface_name}" do
    source "hostname.interface_name.erb"
    mode 0644
    nic = node[:loadbalancer][:interfaces][interface_name]
    inet = "#{nic[:ip]} #{nic[:netmask]} NONE"
    variables(
         :inet => inet
    )
  end
end

template "/etc/hostname.carp0" do
  source "hostname.interface_name.erb"
  mode 0644
  nic = node[:loadbalancer][:ext_if]
  carp = nic[:carp]
  inet = "#{carp[:ip]} #{carp[:netmask]} #{carp[:broadcast]} #{carp[:options]} carpdev #{nic[:name]} pass #{carp[:password]}"
  variables(
      inet => inet
  )
end

template "/etc/hostname.carp1" do
  source "hostname.interface_name.erb"
  mode 0644
  nic = node[:loadbalancer][:int_if]
  carp = nic[:carp]
  inet = "#{carp[:ip]} #{carp[:netmask]} #{carp[:broadcast]} #{carp[:options]} carpdev #{nic[:name]} pass #{carp[:password]}"
  variables(
      inet => inet
  )
end

template "/etc/hostname.pfsync0" do
  source "hostname.pfsync.erb"
  mode 0644

end

template "/etc/pf.conf" do
  source "pf.conf.erb"
  mode 0644
end
template "/etc/relayd.conf" do
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