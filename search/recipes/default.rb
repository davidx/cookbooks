
portage_package "app-misc/sphinx" do
  action :install
end

if File.exists?('/u/apps/exampleapp/config/development.sphinx.conf')
  link '/etc/sphinx/sphinx.conf'  do
    to '/u/apps/exampleapp/config/development.sphinx.conf'
  end
end
