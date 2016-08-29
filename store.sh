#!/bin/bash

yum -y update
yum -y install targetcli
yum -y install lvm2
systemctl start target
systemctl enable target
systemctl restart target.service
firewall-cmd --permanent --add-port=3260/tcp
firewall-cmd --reload
sfdisk /dev/sdc << EOF
;
EOF
sfdisk /dev/sdd << EOF
;
EOF
sfdisk /dev/sde << EOF
;
EOF
sfdisk /dev/sdf << EOF
;
EOF
sfdisk /dev/sdg << EOF
;
EOF
sfdisk /dev/sdh << EOF
;
EOF
sfdisk /dev/sdi << EOF
;
EOF
sfdisk /dev/sdj << EOF
;
EOF
pvcreate /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 /dev/sdg1 /dev/sdh1 /dev/sdi1 /dev/sdj1
vgcreate vg1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 /dev/sdg1 /dev/sdh1 /dev/sdi1 /dev/sdj1
cat <<EOF | base64 --decode >  ~/ose_pvcreate_lun
IyEvYmluL2Jhc2gKCiMgJDEgPSB2b2x1bWVncm91cAojICQyID0gc2l6ZQojICMzID0gY291bnQKCmlmIFsgJCMgLWVxIDAgXTsgdGhlbgogICBlY2hvICJwdmNyZWF0ZWx1biB2b2xncm91cCBzaXplIGNvdW50IgogICBlY2hvICIgICAgdm9sZ3JvdXAgaXMgdGhlIHZvbGdyb3VwIGFzIGNyZWF0ZWQgYnkgdmdjcmVhdGUiCiAgIGVjaG8gIiAgICBzaXplIC0gZXhhbXBsZSAxRyIKICAgZWNobyAiICAgIGNvdW50IC0gT3B0aW9uYWwgLSBOdW1iZXIgb2YgbHVucyB0byBjcmVhdGUiCiAgIGV4aXQgMAogICBmaQojIENhbGwgb3Vyc2VsdmVzIHJlY3Vyc2l2ZWx5IHRvIGRvIHJlcGVhdHMKaWYgWyAkIyAtZXEgMyBdOyB0aGVuCiAgIGZvciAoKGk9MDtpIDwgJDM7aSsrKSkKICAgICAgIGRvCiAgICAgIC4vb3NlX3B2Y3JlYXRlX2x1biAkMSAkMgogICAgICBkb25lCiAgICBleGl0IDAKICAgZmkKCkxVTkZJTEU9fi8ub3NlbHVuY291bnQuY250ClRBRz0kMAoKaWYgWyAtZSAke0xVTkZJTEV9IF07IHRoZW4KICAgIGNvdW50PSQoY2F0ICR7TFVORklMRX0pCmVsc2UKICAgIHRvdWNoICIkTFVORklMRSIKICAgIGNvdW50PTAKZmkKCigoY291bnQrKykpCgplY2hvICR7Y291bnR9ID4gJHtMVU5GSUxFfQoKZXhwb3J0IHZvbG5hbWU9b3NlIiRjb3VudCJ4IiQyIgoKbHZjcmVhdGUgLUwgJDIgLW4gJHZvbG5hbWUgJDEgfCBsb2dnZXIgLS10YWcgJFRBRwpta2ZzLmV4dDQgLXEgLUYgX0YgL2Rldi92ZzEvJHZvbG5hbWUgMj4mMSB8IGxvZ2dlciAtLXRhZyAkVEFHCmlmIFsgJHtjb3VudH0gLWVxIDEgXTsgdGhlbgogICAgIGVjaG8gIlNldHVwIGRldmljZSIKICAgICB0YXJnZXRjbGkgL2lzY3NpIGNyZWF0ZSBpcW4uMjAxNi0wMi5sb2NhbC5zdG9yZTE6dDEgfCAgbG9nZ2VyIC0tdGFnICRUQUcKICAgICB0YXJnZXRjbGkgL2lzY3NpL2lxbi4yMDE2LTAyLmxvY2FsLnN0b3JlMTp0MS90cGcxL2FjbHMgY3JlYXRlIGlxbi4yMDE2LTAyLmxvY2FsLmF6dXJlLm5vZGVzIHwgbG9nZ2VyIC0tdGFnICRUQUcKICAgICB0YXJnZXRjbGkgL2lzY3NpL2lxbi4yMDE2LTAyLmxvY2FsLnN0b3JlMTp0MS90cGcxLyBzZXQgYXR0cmlidXRlIGF1dGhlbnRpY2F0aW9uPTAgfCBsb2dnZXIgLS10YWcgJFRBRwogICAgIHRhcmdldGNsaSBzYXZlY29uZmlnCmZpCnRhcmdldGNsaSBiYWNrc3RvcmVzL2Jsb2NrLyBjcmVhdGUgIiR2b2xuYW1lIiAvZGV2L3ZnMS8iJHZvbG5hbWUiIHwgIGxvZ2dlciAtLXRhZyAkVEFHCnRhcmdldGNsaSAvaXNjc2kvaXFuLjIwMTYtMDIubG9jYWwuc3RvcmUxOnQxL3RwZzEvbHVucyBjcmVhdGUgL2JhY2tzdG9yZXMvYmxvY2svIiR2b2xuYW1lIiB8IGxvZ2dlciAtLXRhZyAkVEFHCgp0YXJnZXRjbGkgc2F2ZWNvbmZpZyB8IGxvZ2dlciAtLXRhZyAkVEFHCgoK
EOF
chmod +x ~/ose_pvcreate_lun
~/ose_pvcreate_lun vg1 1G 400
~/ose_pvcreate_lun vg1 10G 20
~/ose_pvcreate_lun vg1 50G 4
firewall-cmd --permanent --add-port=3260/tcp
firewall-cmd --reload
systemctl restart target.service
return 0
