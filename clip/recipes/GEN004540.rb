## (GEN004540: CAT II) The SA will ensure the help sendmail command is
## disabled.
file "/etc/mail/helpfile.bak" do
  source "/etc/mail/helpfile"
end
file "/etc/mail/helpfile" do
  content "\n",
end
execute "disable_help" do
  command "sed -i '/HelpFile/s/^/#/' /etc/mail/sendmail.cf"
  not_if system "grep -q '^#.*HelpFile' /etc/mail/sendmail.cf"
end