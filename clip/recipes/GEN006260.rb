## (GEN006260: CAT II) (Previously - L154) The SA will ensure the
## /etc/news/hosts.nntp file has permissions of 600, or more restrictive.
file "/etc/news/hosts.nntp" do
  mode 600
end

