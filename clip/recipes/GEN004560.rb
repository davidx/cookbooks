## (GEN004560: CAT II) (Previously - G646) To help mask the e-mail version,
## the SA will use the following in place of the original sendmail greeting
## message:
##   O SmtpGreetingMessage= Mail Server Ready ; $b
execute "smtp_greeting" do
  command "sed -i '/SmtpGreetingMessage/ c\O SmtpGreetingMessage= Mail Server Ready ; $b' /etc/mail/sendmail.cf"
  not_if system "grep -q 'O SmtpGreetingMessage= Mail Server Ready ; $b' /etc/mail/sendmail.cf"
end
