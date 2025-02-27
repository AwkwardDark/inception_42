#!/bin/bash
mkdir -p /var/run/vsftpd/empty

# Create the FTP user# 
useradd -m -d /home/pajimene -s /bin/bash $(cat /run/secrets/ftp_user)
echo "$(cat /run/secrets/ftp_user):$(cat /run/secrets/ftp_password)" | chpasswd

chmod 555 /home/pajimene
mkdir -p /home/pajimene/volume

vsftpd