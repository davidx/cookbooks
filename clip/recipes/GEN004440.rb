## (GEN004440: CAT IV) (Previously - G133) The SA will ensure the sendmail
## logging level (the detail level of e-mail tracing and debugging
## information) in the sendmail.cf file is set to a value no lower than
## nine (9).
execute "sendmail_loglevel" do
  command "sed -i '/LogLevel/ c\O LogLevel=9' /etc/mail/sendmail.cf"
  not_if system "grep -q 'O LogLevel=9' /etc/mail/sendmail.cf"
end