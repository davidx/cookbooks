bash "install_rvm" do
  user "ip"
  code <<-EOH
  gem install rvm
  rvm-install
  EOH
  not_if "rvm -v |grep rvm|awk '{print $2}' | grep #{node[:rvm][:version]}"

end

bash "rvm install #{node[:rvm][:ruby][:version]}" do
  user "ip"
  code <<-EOH
  rvm use  #{node[:rvm][:ruby][:version]}
  rvm default  #{node[:rvm][:ruby][:version]}
  gem install chef
  EOH
  not_if "rvm list|grep #{node[:rvm][:ruby][:version]}"
end


node[:rvm][:ruby][:gems].each do |gem|
  gem_package gem[:name] do
    if gem[:version] && !gem[:version].empty?
      version gem[:version]
    end
    if gem[:source]
      source gem[:source]
    end
    action :install
    gem_binary "/home/ip/.rvm/rubies/#{node[:rvm][:ruby][:version]}/bin/gem"
  end
end
