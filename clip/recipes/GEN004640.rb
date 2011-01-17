## (GEN004640: CAT I) (Previously - V126) The SA will ensure the decode entry
## is disabled (deleted or commented out) from the alias file.

execute "refresh_aliases" do
  command = "/usr/bin/newaliases"
  action :nothing
end


comment_out_lines_beginning_with("decode", "/etc/aliases")


execute "aliases_sed" do

  command "sed -i s/^decode\:/\#decode\:/ #{file_name}"
  only_if do
    IO.read('/etc/aliases').match(/^decode/)
  end
  notifies :run, resources(:execute => "refresh_aliases")
end




