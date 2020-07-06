## call AnyConnect
function vpn
  set PIN 1234

  set vpn_connect "vpn.csas.cz/linuxadm"  # mgmt vlan
  #set vpn_connect "vpn.csas.cz"          # data vlan
  # set vpn_connect "vpnemergency.csas.cz"


  while not security list-keychains -d dynamic | grep -q 'ProID+'
    echo -n "."
    sleep 2
  end

  set KEYCHAIN (security list-keychains -d dynamic | grep 'ProID+' | tr -d '"' | sed -e 's/^[[:space:]]*//')
  echo "$KEYCHAIN"

  # kill running window process if exists
  killall -d "Cisco AnyConnect Secure Mobility Client" &>/dev/null && \
    killall "Cisco AnyConnect Secure Mobility Client"


  while not security unlock-keychain -p $PIN $KEYCHAIN
    echo -n "."
    sleep 2
  end

  # cisco anyconnect connect to vpn
  echo "vpn_connect: $vpn_connect"
  /opt/cisco/anyconnect/bin/vpn -s connect $vpn_connect || return $status
  /sbin/ifconfig utun1 | grep "inet "

  # renew kerberos ticket
  sleep 2
  kinit --keychain sol60210@CEN.CSIN.CZ && klist || return $status

  # cd $HOME
  # cd "$HOME" || return 1
end
