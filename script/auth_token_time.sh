 #!/bin/sh

auth_start=`cat /var/log/syslog |grep "RTL871X" |grep "start auth" |tail -n 1 |awk '{print $6}' |sed 's/\[//g; s/\]//g'`
auth_success=`cat /var/log/syslog |grep "RTL871X" |grep "auth success" |tail -n 1 |awk '{print $6}' |sed 's/\[//g; s/\]//g'`

auth_token_time=$(bc <<< "$auth_success - $auth_start")

case $auth_token_time in
    ''|*[!0-9.]*) echo 0.0 ;;
    *) echo 0$auth_token_time;;
esac
