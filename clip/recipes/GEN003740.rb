## (GEN003740: CAT II) (Previously - G108) The SA will ensure the inetd.conf
## (xinetd.conf for Linux) file has permissions of 440, or more restrictive.
## The Linux xinetd.d directory will have permissions of 755, or more
## restrictive. This is to include any directories defined in the includedir
## parameter.
file "/etc/xinetd.d" do
  mode 755
end
# Follow the spirit of the STIG,
# make conf files in xinet.d as locked down as xinetd.conf
file "/etc/xinetd.d/*" do
  mode 440
end
file "/etc/xinetd.conf" do
  mode 440
end

