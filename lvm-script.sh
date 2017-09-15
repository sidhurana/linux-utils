#!/bin/bash
#Created by Sudhir Kumar
#Just for fun and time saving

DEV_NAME="sdb"
VG_NAME="vg_$1"
LV_NAME="lv_$1"
LV_DISK="$2"
DATA_FOLDER="$3"
MAPPER_NAME="vg_$1-lv_$1"
FSTAB_FILE="/etc/fstab"

if [ $# -ne 3 ]; then
echo "Please pass all arguements. HELP: ./<scriptname> <vg-name: data> <disk_size : +50G> <mount-folder E.g:- /data>"
exit 1
fi

echo "Please keep in mind that this script is not meant to reuse again as it will format filesystem."
#Find OS
OS_NAME=`cat /etc/*-release | grep -i '^ID=' | cut -d'=' -f2`
if [ $OS_NAME == ubuntu ]; then 
apt-get -y install xfsprogs
fi

pvcreate /dev/$DEV_NAME
vgcreate $VG_NAME /dev/$DEV_NAME
lvcreate -L $LV_DISK -n $LV_NAME $VG_NAME
mkdir $DATA_FOLDER
read -p "Are you sure you want to continue and format Filesystem? <y/N> " prompt
if [[ $prompt =~ [yY](es)* ]]; then
mkfs.xfs /dev/mapper/$MAPPER_NAME
echo /dev/mapper/$MAPPER_NAME $DATA_FOLDER xfs defaults 0 0 >> $FSTAB_FILE
mount -a
else
echo "Exiting now"
exit 1
fi

