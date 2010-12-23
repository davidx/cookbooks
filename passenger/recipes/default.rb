

template '/etc/apache2/modules.d/30_mod_passenger.conf' do
    source "30_mod_passenger.conf.erb"
end
bash "install-passenger" do
  command = "#{node[:ruby][:current][:prefix]}/bin/passenger-install-apache2-module -a "
  print command + "\n"
  code command
  installed_file = "#{node[:ruby][:current][:prefix]}/lib/ruby/gems/1.8/gems/"
  installed_file << 'passenger-' + node[:passenger][:version] + '/ext/apache2/mod_passenger.so'
  p installed_file
  not_if { File.exists?(installed_file) }

end
