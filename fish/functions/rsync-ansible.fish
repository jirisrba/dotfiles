# git push
function rsync-ansible
  rsync -Ccazv --exclude='inventory/hosts' --exclude=.DS_Store --exclude=.git -e "ssh -i ~/.ssh/id_rsa.oracle" ~/code/ansible/ansible-oracle/ oracle@oem12-m.vs.csin.cz:/dba/local/ansible_dev/
end
