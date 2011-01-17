## (LNX00360: CAT II) (Previously - L032) The SA will enable the X server
## –audit (at level 4) and –s option (with 15 minutes as the timeout time)
## options.
cookbook_file "/etc/gdm/custom.conf" do
  source => "custom.conf"
end

