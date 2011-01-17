# AC-15: Automated Marking
# Chef Actions:
# cupsd.conf taken from linux LSPP project - http://klaus.vh.swiftco.net/lspp/git/

template "/etc/cups/cupsd.conf" do
  source "cupsd.conf"
end

