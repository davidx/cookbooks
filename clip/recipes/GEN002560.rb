## (GEN002560: CAT II) (Previously - G089) The SA will ensure the system and
## user umask is 077.
execute "bash_umask" do
  command "sed -i '/umask/ c\umask 077' /etc/bashrc"
  not_if "grep -q 'umask 077' /etc/bashrc";
end


execute "csh_umask" do
  command "sed -i '/umask/ c\umask 077' /etc/csh.cshrc"
  not_if "grep -q 'umask 077' /etc/csh.cshrc"
end