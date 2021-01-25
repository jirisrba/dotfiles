# CSAS
# mount smfs BUBSUSRS
function mu
    # kinit
    # kinit --keychain sol60210@CEN.CSIN.CZ

    if not test -d /Volumes/SOL60210
      sudo mkdir /Volumes/SOL60210
      sudo chown (whoami) /Volumes/SOL60210
    end
    mount_smbfs //cen.csin.cz\;sol60210@PV1WINFS1100.csin.cz/BUBSUSRS/uziv/UzivData/SOL60210 /Volumes/SOL60210
    ##open 'smb://pwinfs100.csin.cz/BUBSUSRS/uziv/UzivData/SOL60210'
    if test -d /Volumes/SOL60210
      cd /Volumes/SOL60210/Drafts || exit
    end
    pwd
end
