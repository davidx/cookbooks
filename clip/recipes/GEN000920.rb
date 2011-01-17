## (GEN000920: CAT II) (Previously - G023) The SA will ensure the root account
## home directory (other than ‘/’) has permissions of 700. Do not change the
## permissions of the ‘/’ directory to anything other than 0755.
directory "/root" do
  mode 700
  owner "root"
#FIXME	require => User["root"]; 
end

