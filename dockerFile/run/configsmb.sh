#!/bin/bash
echo "[shared]" >> /etc/samba/smb.conf
echo "  comment = Samba" >> /etc/samba/smb.conf
echo "  path = /shared" >> /etc/samba/smb.conf
echo "  read only = no" >> /etc/samba/smb.conf
echo "  browsable = yes" >> /etc/samba/smb.conf
echo "  guest ok = yes" >> /etc/samba/smb.conf
echo "  guest only = yes" >> /etc/samba/smb.conf
