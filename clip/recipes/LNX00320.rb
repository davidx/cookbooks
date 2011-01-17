## (LNX00320: CAT I) (Previously - L140) The SA will delete accounts that
## provide a special privilege such as shutdown and halt.

remove_users = %w[shutdown halt sync ftp]
remove_users.each do |username|
  user username do
    action :remove
  end
end