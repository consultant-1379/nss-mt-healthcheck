#!/bin/bash

ssh=`grep -Eo '[0-9]+' sshtime.job | sort -rn | head -1`
com1=`grep -Eo '[0-9]+' com1time.job | sort -rn | head -1`
com2=`grep -Eo '[0-9]+' com2time.job | sort -rn | head -1`
com3=`grep -Eo '[0-9]+' com3time.job | sort -rn | head -1`

echo -n " SSH:$ssh COM1:$com1 COM2:$com2 COM3:$com3" >> stats.job
