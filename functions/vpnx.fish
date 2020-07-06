# disconnect VPN
function vpnx

  for dir in /Volumes/SOL60210 /Volumes/dba
    if test -d $dir
      cd $HOME
      umount $dir
    end
  end

  /opt/cisco/anyconnect/bin/vpn disconnect
end
