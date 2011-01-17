## (GEN001560: CAT II) (Previously - G068) The user, application developers,
## and the SA will ensure user files and directories will have an initial
## permission no more permissive than 700, and never more permissive than 750.

file "/home" do
  recursive true
  mode "600"
end
directory "/home" do
  recursive true
  mode "700"
end
