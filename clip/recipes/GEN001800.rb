## (GEN001800: CAT II) (Previously - G038) The SA will ensure all
## default/skeleton dot files have permissions of 644, or more restrictive.
file "/etc/skel" do
  recursive true
  mode 644
end

