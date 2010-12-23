if node[:ruby] && ruby[:ruby].key?(:gems)
  node[:ruby][:gems].each do |gem|
    gem_package gem[:name] do
      if gem[:version] && !gem[:version].empty?
        version gem[:version]
      end
      if gem[:source]
        source gem[:source]
      end
      action :install
      gem_binary node[:ruby][:prefix] + '/bin/gem'
    end
  end
end
