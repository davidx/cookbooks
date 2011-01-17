## (GEN003520: CAT III) The SA will ensure the owner and group owner of the
## core dump  data directory is root with permissions of 700, or more
## restrictive.
directory "/var/crash" do
  owner "root"
  group "root"
  mode 700
end
file "/var/crash" do
  recursive true
  mode 700
end
 

