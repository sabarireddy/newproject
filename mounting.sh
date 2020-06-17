sudo mkdir /mnt/azurefiles
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/prodqaeastusstorage.cred" ]; then
    sudo bash -c 'echo "username=prodqaeastusstorage" >> /etc/smbcredentials/prodqaeastusstorage.cred'
    sudo bash -c 'echo "password=mqe/rNuoPHoDSDKhoQm2OpnqA+CGuICpB/4VfS2eHmvx8IhFJnvuz11IDSmtD9pv6jBVKe4+YZT9kLPmAYU7uw==" >> /etc/smbcredentials/prodqaeastusstorage.cred'
fi
sudo chmod 600 /etc/smbcredentials/prodqaeastusstorage.cred

sudo bash -c 'echo "//prodqaeastusstorage.file.core.windows.net/trfileshare /mnt/azurefiles cifs nofail,vers=3.0,credentials=/etc/smbcredentials/prodqaeastusstorage.cred,dir_mode=0755,file_mode=0664" >> /etc/fstab'


sudo mount -t cifs //prodqaeastusstorage.file.core.windows.net/trfileshare /mnt/azurefiles -o vers=3.0,credentials=/etc/smbcredentials/prodqaeastusstorage.cred,dir_mode=0755,file_mode=0664
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash
sudo -s

yum update -y

yum install cifs-utils -y

sudo mkdir '$4'
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
sudo touch /etc/smbcredentials/prodqaeastusstorage.cred
fi
if [ ! -f "/etc/smbcredentials/prodqaeastusstorage.cred" ]; then
    sudo bash -c 'echo "username=$1" >> /etc/smbcredentials/prodqaeastusstorage.cred'
    sudo bash -c 'echo "password=$2" >> /etc/smbcredentials/prodqaeastusstorage.cred'
fi
sudo chmod 600 /etc/smbcredentials/prodqaeastusstorage.cred

sudo bash -c 'echo "//"$1".file.core.windows.net/"$3" "$4" -o vers=3.0,credentials=/etc/smbcredentials/prodqaeastusstorage.cred,dir_mode=0755,file_mode=0664" >> /etc/fstab'


sudo mount -t cifs //"$1".file.core.windows.net/"$3" "$4" -o vers=3.0,credentials=/etc/smbcredentials/prodqaeastusstorage.cred,dir_mode=0755,file_mode=0664




$1=prodqaeastusstorage
$2=storageaccountkey
$3=trfileshare
$4=/mnt/azurefiles
$5=rcjadmin
