function killvpn
  echo "Killing ALL Proid processes"
  pgrep -lf Proid
  sudo pkill -f "Proid"
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.securityd.plist
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.securityd.plist
end
