
prefix = node[:nagios][:prefix]
nagios_package = node[:nagios][:package]
nagios_package_source_url = node[:nagios][:package_source_url] + nagios_package

remote_file "nagios" do
  path "/tmp/#{nagios_package}"
  source nagios_package_source_url
  not_if { File.exists? "/tmp/#{nagios_package}" }
end

bash "install nagios" do
  commands = ["cd /tmp"]
  commands << "tar xvzf #{nagios_package}"
  commands << "cd #{nagios_package.gsub(/\.tar\.gz/,'')}"
  commands << "./configure --prefix=#{prefix}"
  commands << "make clean"
  commands << "make all"
  commands << "sudo make install"
  code commands.join(" && ")
end

directory prefix do
  owner "root"
  mode 0755
  recursive true
end

template "#{prefix}/objects/templates.cfg" do
  source "templates.erb"
end

template "#{prefix}/nagios.cfg" do
  source "nagios.erb"
end

template "#{prefix}/objects/commands.cfg" do
  source "commands.erb"
end

template "#{prefix}/objects/contacts.cfg" do
  source "contact.erb"
end

template "#{prefix}/objects/hosts.cfg" do
  source "hosts.erb"
end

template "#{prefix}/objects/services.cfg" do
  source "services.erb"
end

template "#{prefix}/resource.cfg" do
  source "resource.erb"
end

template "#{prefix}/objects/cgi.cfg" do
  source "cgi.erb"
end
template "#{prefix}/objects/time.cfg" do
  source "time.erb"
end
