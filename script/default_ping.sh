#!/bin/bash

ROUTER=`sudo route |grep default |awk '{print $2}'`

RESULT=`sudo ping -c 1 $ROUTER |grep avg |awk '{print $4}' |awk -F "/" '{print $2}'`

case $RESULT in
   (*[!0-9][.]*|'') echo 0;;
   (*)           echo $RESULT;;
esac
