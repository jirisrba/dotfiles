function vpns
  /opt/cisco/anyconnect/bin/vpn status | grep -Po '(Disc|C)onnected' | uniq
end
