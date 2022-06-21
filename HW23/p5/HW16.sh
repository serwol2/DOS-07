#!/bin/bash
echo -n $(cat /etc/os-release | grep ID)" "
echo $(uname -r)
echo $(hostname -I)
echo 'Load Average (15 min):' $(uptime |awk '{print $10;}') $(uptime -p)
echo 'Used memory:' $(free -h| grep "Mem" | awk '{print $3;}')
echo 'Users:' $(who -q)
echo