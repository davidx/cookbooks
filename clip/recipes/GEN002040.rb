## (GEN002040: CAT I) The SA will ensure .rhosts, .shosts, hosts.equiv, nor
## shosts.equiv are used, unless justified and documented with the IAO.
file "/root/.rhosts" do
  action :delete
end
file "/root/.shosts" do
  action :delete
end
file "/etc/hosts.equiv" do
  action :delete
end
