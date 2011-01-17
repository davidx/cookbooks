## (LNX00160: CAT II) (Previously - L074) The SA will ensure the grub.conf
## file has permissions of 600, or more restrictive.
file "/boot/grub/grub.conf" do
  mode 600
end
