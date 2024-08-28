#!/bin/bash 
echo $@ is 
echo "spawn snmpget -v 2c -r 0 -t 4 -c \$COMMUNITY \$NODEIP:\$PORT $@" >> script1.sh
echo "expect {
    -re \"Timeout: No Response from\" { send_user \"Timedout in bulkget table $@ \\n\" ; exit 1}
     eof { }
}" >> script1.sh

