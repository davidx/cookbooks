## (GEN001820: CAT II) The SA will ensure the owner of all default/skeleton
## dot files is root or bin.
file "/etc/skel" do
  owner "root"
end

