version="4.1.0"
source_url="http://www.spread.org/download/spread-src-#{version}.tar.gz"
dist_path='/tmp/distfiles'
full_dist_path="#{dist_path}/spread-src-#{version}.tar.gz"

remote_file "get spread" do
  FileUtils.mkdir_p(dist_path)
  path full_dist_path
  source source_url
  not_if { File.exists? full_dist_path }
end

remote_file "/tmp/#{tarball}" do
 source "#{node[:openfire][:tarball_url]}"
 mode "0644"
 checksum "#{node[:openfire][:tarball_checksum]}"
end

execute "tar" do
 user node[:openfire][:user]
 group node[:openfire][:group]

 installation_dir = node[:openfire][:installation_dir]
 cwd installation_dir
 command "tar zxf /tmp/#{tarball}"
 creates installation_dir + "/" + node[:openfire][:dirname]
 action :run
end
