#!/bin/bash
sudo -s

yum update -y

yum install cifs-utils -y

sudo mkdir '$4'
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/prodqaeastusstorage.cred" ]; then
    sudo bash -c 'echo "username=$1" >> /etc/smbcredentials/prodqaeastusstorage.cred'
    sudo bash -c 'echo "password=$2" >> /etc/smbcredentials/prodqaeastusstorage.cred'
fi
sudo chmod 600 /etc/smbcredentials/prodqaeastusstorage.cred

sudo bash -c 'echo "//"$1".file.core.windows.net/"$3" "$4" -o vers=3.0,credentials=/etc/smbcredentials/prodqaeastusstorage.cred,dir_mode=0755,file_mode=0664" >> /etc/fstab'

sudo mount -t cifs //"$1".file.core.windows.net/"$3" "$4" -o vers=3.0,credentials=/etc/smbcredentials/prodqaeastusstorage.cred,dir_mode=0755,file_mode=0664
