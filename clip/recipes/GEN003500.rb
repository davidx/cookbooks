## (GEN003500: CAT III) The SA will ensure core dumps are disabled or
## restricted.

edit_file "/etc/security/limits.conf" do
  append_if_no_such_line "* - core 0"
end