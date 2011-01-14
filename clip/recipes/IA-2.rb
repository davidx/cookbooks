# IA-2: User Identification and Authentication

execute "IA-2" do
## (GEN000540: CAT II) (Previously - G004) The SA will ensure passwords are
## not changed more than once a day.

# default path for following execs
  environment({'PATH' => "/usr/bin:/usr/sbin:/bin:sbin"})

  commands = ["sed -i '/^PASS_MIN_DAYS/ c\PASS_MIN_DAYS\t1' /etc/login.defs"]

## (GEN000580: CAT II) (Previously - G019) The IAO will ensure all passwords contain a
## minimum of eight characters.
  commands << 'sed -i "s/PASS_MIN_LEN[ \t]*[0-9]*/PASS_MIN_LEN\t8/" /etc/login.defs'
  commands << 'sed -i "/^PASS_MIN_LEN/ c\PASS_MIN_LEN\t8" /etc/login.defs'

## (GEN000600: CAT II) (Previously - G019) The IAO will ensure passwords include at
## least two alphabetic characters, one of which must be capitalized.
# See GEN000460

## (GEN000700: CAT II) (Previously - G020) The SA will ensure passwords are
## changed at least every 90 days.
  commands << "sed -i '/^PASS_MAX_DAYS/ c\PASS_MAX_DAYS\t60' /etc/login.defs"
  command commands.join(" && ")
  action :run
end

## (GEN000560: CAT I) (Previously - G018) The SA will ensure each account in
## the /etc/passwd file has a password assigned or is disabled in the
## password, shadow, or equivalent, file by disabling the password and/or by
## assigning a false shell in the password file.

ruby_block "GEN000560" do
  block do
    IO.read('/etc/shadow').split(/\n/).each do |shadow_line|
      username, shadow_hash = shadow_line.split(/:/).slice(0, 1)
      unless shadow_hash.kind_of?(String) && shadow_hash.length > 1
        system "/usr/sbin/usermod -L -s /dev/null #{username}"
      end
    end
  end
end


## (GEN000800: CAT II) (Previously - G606) The SA will ensure passwords will not be
## reused within the last ten changes.
# See GEN000460


## (GEN001380: CAT II) (Previously - G048) The SA will ensure the /etc/passwd
## file has permissions of 644, or more restrictive.
## (GEN001400: CAT I) (Previously - G047) The SA will ensure the owner of the
## /etc/passwd and /etc/shadow files (or equivalent) is root.
## (GEN001420: CAT II) (Previously - G050) The SA will ensure the /etc/shadow
## file (or equivalent) has permissions of 400.
file "/etc/passwd" do
  owner "root"
  mode 644
end

file "/etc/shadow" do
  owner "root"
  mode 644
end

