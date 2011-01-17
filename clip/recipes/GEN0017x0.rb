## (GEN001720: CAT II) The SA will ensure global initialization files have
## permissions of 644, or more restrictive.
## (GEN001740: CAT II) The SA will ensure the owner of global initialization
## files is root.
## (GEN001760: CAT II) The SA will ensure the group owner of global
## initialization files is root, sys, bin, other, or the system default.

file "/etc/profile" do
  mode 644
  owner "root"
  group "root"
end
file "/etc/bashrc" do
  mode 644
  owner "root"
  group "root"
end
file "/etc/environment" do
  mode 644
  owner "root"
  group "root"
end
## (GEN001780: CAT III) (Previously - G112) The SA will ensure global
## initialization files contain the command mesg –n.
edit_file "/etc/profile" do
  append_if_no_such_line("mesg n")
end
edit_file "/etc/bashrc" do
  append_if_no_such_line("mesg n")
end
	
