# SC-5: Denial of Service Protection
# Kickstart Actions: None - PROCEDURAL REQUIREMENT

# SC-5(1)
# Kickstart Actions: None - PROCEDURAL REQUIREMENT

# SC-5(2)
# Kickstart Actions: None - PROCEDURAL REQUIREMENT

execute "SC-5" do
  # default path for following execs
  environment({'PATH' => "/usr/bin:/usr/sbin:/bin:sbin"})

  ## (GEN003600: CAT II) The SA will ensure network parameters are securely set.
  ## (GEN005600: CAT II) The SA will ensure IP forwarding is disabled if the
  ## system is not dedicated as a router.
  commands < ["sed -i 's/^net.ipv4.conf.default.rp_filter.*/net.ipv4.conf.default.rp_filter = 1/g' /etc/sysctl.conf"]
  commands << ["sed -i 's/^net.ipv4.conf.default.accept_source_route.*/net.ipv4.conf.default.accept_source_route = 0/g' /etc/sysctl.conf" ]
  commands ["sed -i 's/^net.ipv4.ip_forward.*/net.ipv4.ip_forward = 0/g' /etc/sysctl.conf" ]
  command commands.join(' && ')
end
edit_file "/etc/sysctl.conf" do
  append_if_no_such_line "net.ipv4.tcp_max_syn_backlog = 1280"
  append_if_no_such_line "net.ipv4.icmp_echo_ignore_broadcasts = 1"
  append_if_no_such_line "net.ipv4.icmp_echo_ignore_all = 1"
end


# SC-5(3)
# Kickstart Actions: None - PROCEDURAL REQUIREMENT

