# disconnect VPN
function vpnx
  /opt/cisco/anyconnect/bin/vpn disconnect

  killall -d "Cisco AnyConnect Secure Mobility Client" &>/dev/null && \
    killall "Cisco AnyConnect Secure Mobility Client"
end
