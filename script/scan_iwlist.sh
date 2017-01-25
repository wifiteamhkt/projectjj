#!/bin/sh
#
#
#
#
#
#
`sudo iwlist wlan0 scanning | awk -F '[ :=]+' '/(Address)/{ printf $6":"$7":"$8":"$9":"$10":"$11 " "} /(ESSID)/{printf $3 " "} /(Protocol|Rates)/{printf $4 " "}  /Frequency/{printf $3" "} /Quality/{print $3" "$6}' > /tmp/scan_result_iwlist`

`sudo iw wlan0 scan | awk  -F '[ =(]+' '/(wlan0)/{ printf $2" "} /(signal)/{print $2}' >  /tmp/scan_result_signal`

echo "Completed"
