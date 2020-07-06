#!/usr/bin/env bash

# simple calc
function =
{
  echo "$@" | bc -l
}

# man color pages
function man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;38;5;74m") \
    LESS_TERMCAP_so=$(printf "\e[38;5;246m") \
    LESS_TERMCAP_us=$(printf "\e[04;38;5;146m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    man "$@"
}

# change directory to the current Finder directory
# replace by plugin osx
# function cdf() {
#     target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
#     if [ "$target" != "" ]; then
#         cd "$target"; pwd
#     else
#         echo 'No Finder window found' >&2
#     fi
# }

# MacOS update
function update() {
    #local gisty="gisty pull_all; gisty sync_delete"
    echo mackup backup -f
    mackup backup -f
    echo brew upgrade
    brew update && brew upgrade ; brew cleanup
    echo softwareupdate
    sudo -H softwareupdate -i -a
    # gem update -n /usr/local/bin --system
    pip3 install --upgrade pip setuptools wheel
    pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip3 install -U
    echo npm update
    npm install npm -g; npm update -g
    echo gem update
    sudo gem update --system; sudo -H gem update; sudo -H gem cleanup
}

# CSAS
# mount smfs BUBSUSRS
function mu() {
    # kinit
    # kinit --keychain sol60210@CEN.CSIN.CZ

    [[ ! -d /Volumes/SOL60210 ]] && sudo mkdir /Volumes/SOL60210
    [[ -d /Volumes/SOL60210 ]] && sudo chown "$(whoami)" /Volumes/SOL60210
    mount_smbfs //cen.csin.cz\;sol60210@PV1WINFS1100.csin.cz/BUBSUSRS/uziv/UzivData/SOL60210 /Volumes/SOL60210
    ##open 'smb://pwinfs100.csin.cz/BUBSUSRS/uziv/UzivData/SOL60210'
    [[ -d /Volumes/SOL60210 ]] && cd /Volumes/SOL60210/Drafts || return 1
    pwd
}

# umount smfs BUBSUSRS
function uu() {
    [[ -d /Volumes/SOL60210 ]] && { cd "$HOME" || exit; umount /Volumes/SOL60210 ; }
}

## call AnyConnect
function vpn() {
  PIN=1234

  #vpn_connect="vpn.csas.cz"          # data vlan
  vpn_connect="vpn.csas.cz/linuxadm"  # mgmt vlan


  until [ -n "$(security list-keychains -d dynamic)" ] ; do
    echo -n "."
    sleep 2
  done

  KEYCHAIN=$(security list-keychains -d dynamic | grep 'ProID+' | tr -d '"' | sed -e 's/^[[:space:]]*//')
  echo "$KEYCHAIN"

  # cd $HOME
  cd "$HOME" || return 1

  # kill running window process if exists
  killall -d "Cisco AnyConnect Secure Mobility Client" &>/dev/null && \
    killall "Cisco AnyConnect Secure Mobility Client"


  until $(security unlock-keychain -p $PIN "$KEYCHAIN")
  do
    sleep 2
  done

  # cisco anyconnect connect to vpn
  echo "vpn_connect: $vpn_connect"
  /opt/cisco/anyconnect/bin/vpn -s connect $vpn_connect || return $?
  /sbin/ifconfig utun1 | grep "inet "

  # renew kerberos ticket
  sleep 2
  kinit --keychain sol60210@CEN.CSIN.CZ && klist || return $?
}

## disconnect VPN
function vpnx() {
  [[ -d /Volumes/SOL60210 ]] && { cd ; umount /Volumes/SOL60210 ; }
  [[ -d /Volumes/dba ]] && umount /Volumes/dba
  /opt/cisco/anyconnect/bin/vpn disconnect
}

## status VPN
function vpns() {
  /opt/cisco/anyconnect/bin/vpn status | grep -Po '(Disc|C)onnected' | uniq
}

function killvpn()
{
  echo "Killing ALL Proid processes"
  pgrep -lf Proid
  sudo pkill -f "Proid"
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.securityd.plist
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.securityd.plist
}
