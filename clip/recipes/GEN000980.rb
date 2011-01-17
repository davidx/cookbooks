## (GEN000980: CAT II) (Previously - G026) The SA will ensure root can only log
## on as root from the system console, and then only when necessary to perform
## system maintenance.
file "/etc/securetty" do

  content "console\n"

  ## (LNX00620: CAT II) The SA will ensure the group owner of the /etc/securetty
  ## file is root, sys, or bin.
  group "root"

  ## (LNX00640: CAT II) The SA will ensure the owner of the /etc/securetty file
  ## is root.
  owner "root"

  ## (LNX00660: CAT II) The SA will ensure the /etc/securetty file has
  ## permissions of 640, or more restrictive.
  mode 640
end

