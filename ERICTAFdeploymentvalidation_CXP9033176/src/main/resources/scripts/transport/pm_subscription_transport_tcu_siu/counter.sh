#!/bin/bash

echo_time() {
    date +"%D %T.%6N : $*"
}

rm -f count.log

while true;
do
	Count=$(snmpwalk -v2c -c public 10.141.11.225:4000 1.3.6.1.4.1.193.105.1.1.1.17.1.0 | cut -d" " -f4)
	echo_time "${Count}" >> count.log
	sleep 1
done
