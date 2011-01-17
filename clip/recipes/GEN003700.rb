## (GEN003700: CAT II) The SA will ensure inetd (xinetd for Linux) is disabled
## if all inetd/xinetd based services are disabled.

service "bluetooth" do
  action [:disable, :stop]
end
service "irda" do
  action [:disable, :stop]
end
service "lm_sensors" do
  action [:disable, :stop]
end
service "portmap" do
  action [:disable, :stop]
end
service "rawdevices" do
  action [:disable, :stop]
end
service "rpcgssd" do
  action [:disable, :stop]
end
service "rpcimapd" do
  action [:disable, :stop]
end
service "rpcsvcgssd" do
  action [:disable, :stop]
end
service "sendmail" do
  action [:disable, :stop]
end
service "cups" do
  action [:disable, :stop]
end
service "rhnsd" do
  action [:disable, :stop]
end
service "autofs" do
  action [:disable, :stop]
end
service "xinetd" do
  action [:disable, :stop]
end

execute do
  command "/sbin/chkconfig xinetd off;"
end
  
