
group "users" do
  gid 2001
  group_name "users"
  members node[:users].keys
  action :create
end
node[:users].each do |username, options|
  user username do
    comment options[:fullname]
    uid options[:uid]
    gid options[:gid]
    home options[:homedir]
    shell options[:shell]
    action :manage
    supports :manage_home => true
  end
end
node[:packages].each do |package_name|
  portage_package package_name do
    action :install
  end
end

template "/etc/ssh/authorized_keys" do
  source "authorized_keys"
  owner 'root'
  group 'root'
  mode '0644'
end

template "/etc/ssh/sshd_config" do
  source "sshd_config.erb"
end

template "/etc/ssh/ssh_config" do
  source "ssh_config.erb"
end

