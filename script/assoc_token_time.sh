 #!/bin/sh

assoc_start=`cat /var/log/syslog |grep "RTL871X" |grep "start assoc" |tail -n 1 |awk '{print $6}' |sed 's/\[//g; s/\]//g'`
assoc_success=`cat /var/log/syslog |grep "RTL871X" |grep "assoc success" |tail -n 1 |awk '{print $6}' |sed 's/\[//g; s/\]//g'`

assoc_token_time=$(bc <<< "$assoc_success - $assoc_start")

case $assoc_token_time in
    ''|*[!0-9.]*) echo 0.0 ;;
    *) echo 0$assoc_token_time;;
esac
