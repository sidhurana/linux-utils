from fabric.api import env, run, settings
from fabric.operations import run, put

env.use_ssh_config = True

env.hosts = open('~/fabric/b', 'r').readlines()

use_ssh_config = "true"

def yum_update():
    env.user = "root"
    env.password = "xxxxxxxxxx"
    env.warn_only = True
#    put('/home/sudhkumar/git/fabric/lvm.sh','/root/')
#    run('chmod u+x /root/lvm.sh')
#    run('/root/lvm.sh sdb data +450G /data')
#    run('/root/lvm.sh sdc mysqllogs +40G /mysqllogs')
#    run('yum update -y')
#    run('lvcreate -L +1G -n lv_mysqllogs vg_mysqldata')
#    run('mkdir /mysqllogs')
#    run('mkfs.xfs /dev/mapper/vg_mysqldata-lv_mysqllogs')
#    run('echo "/dev/mapper/vg_mysqldata-lv_mysqllogs /mysqllogs xfs defaults 0 0" >> /etc/fstab')
#    run('mount -a')
#    run('puppet agent -t')
#    run('yum update -y')
#    run('shutdown -r now')

