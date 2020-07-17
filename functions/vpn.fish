## call AnyConnect
function vpn
  set vpn_connect "https://vpn.oict.cz:8080"
  # set vpn_connect "vpn.csas.cz/linuxadm"  # mgmt vlan

  # kill running window process if exists
  killall -d "Cisco AnyConnect Secure Mobility Client" &>/dev/null && \
    killall "Cisco AnyConnect Secure Mobility Client"

  # cisco anyconnect connect to vpn
  echo "vpn_connect: $vpn_connect"
  /opt/cisco/anyconnect/bin/vpn -s connect $vpn_connect || return $status
  /sbin/ifconfig utun1 | grep "inet "

  # renew kerberos ticket
  # sleep 2
  # kinit --keychain sol60210@CEN.CSIN.CZ && klist || return $status
end
