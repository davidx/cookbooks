## (LNX00340: CAT II) (Previously - L142) The SA will delete accounts that
## provide no operational purpose, such as games or operator, and will delete
## the associated software.

remove_users = %w[news operator games gopher nfsnobody]
remove_users.each do |username|
  user username do
    action :remove
  end
end