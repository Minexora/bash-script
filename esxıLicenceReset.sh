#!/bin/bash

export ESXI_SERVER_IP=$1
export ESXI_SERVER_USER=$2


echo -e "Server IP: ${ESXI_SERVER_IP}\nUser: ${ESXI_SERVER_USER}\n"
sleep 2
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $ESXI_SERVER_USER@$ESXI_SERVER_IP -t << EOF

echo "rm -f /etc/vmware/vmware.lic"
sleep 2
rm -f /etc/vmware/vmware.lic

echo "rm -f /etc/vmware/license.cfg"
sleep 2
rm -f /etc/vmware/license.cfg

echo "reboot"
sleep 2
reboot

EOF
