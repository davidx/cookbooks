## (LNX00220: CAT II) (Previously - L080) The SA will ensure the lilo.conf
## file has permissions of 600 or more restrictive.
file "/etc/lilo.conf" do
  mode 600
end

