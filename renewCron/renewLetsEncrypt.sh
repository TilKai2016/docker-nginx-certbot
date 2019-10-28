#!/bin/bash

echo "`date` - 尝试续订证书." >> ./cronLogs/renew.log

renewResult="`docker exec -it nginx-certbot certbot renew`"

fullChainStr=`expr "$renewResult" : '.*/etc/letsencrypt/live/\(.*\) expires on'`
expireTimeStr=`expr "$renewResult" : '.*expires on \(.*\) ('`
letsencryptResponse=`expr "$renewResult" : '.*(skipped)\(.*\)'`

if [[ $fullChainStr != "" && $expireTimeStr != "" ]]
then
    echo "公钥：$fullChainStr , 到期时间：$expireTimeStr." >> ./cronLogs/renew.log
else
    echo "" >> ./cronLogs/renew.log
fi

str="No renewals were attempted"
if [[ $letsencryptResponse =~ $str ]]
then
    echo "$letsencryptResponse 未尝试更新。" >> ./cronLogs/renew.log
else
   echo "$renewResult" >> ./cronLogs/renew.log
fi

echo "============================================================" >> ./cronLogs/renew.log
echo "" >> ./cronLogs/renew.log
echo "" >> ./cronLogs/renew.log
