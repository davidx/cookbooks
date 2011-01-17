file "/var/log/cron" do
  ## (GEN003180: CAT II) (Previously - G210) The SA will ensure cron logs have
  ## permissions of 600, or more restrictive.
  #FIXME	require => Class["ac-3::p4"],
  action :create
  mode 600
  recursive true
end


