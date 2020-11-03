## call AnyConnect
function vpn
  set vpn_server "https://vpn.oict.cz:8080"
  set username "OP3346"
  set group "oict_internal"

  # kill running window process if exists
  # killall -d "Cisco AnyConnect Secure Mobility Client" &>/dev/null && \
  #   killall "Cisco AnyConnect Secure Mobility Client"

  # cisco anyconnect connect to vpn
  echo "vpn_server: $vpn_server"
  sudo openconnect-keychain --user=$username --authgroup=$group $vpn_server
  /sbin/ifconfig utun1 | grep "inet "
end
