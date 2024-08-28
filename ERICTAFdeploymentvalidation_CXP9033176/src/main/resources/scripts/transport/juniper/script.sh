#!/bin/bash 

echo "spawn snmpbulkget -r 0 -t 9 -Cr75  -v 2c -c \$COMMUNITY \$NODEIP:\$PORT $@" >> script1.sh
echo "expect {
    -re \"Timeout: No Response from\" { send_user \"Timedout in bulkget table $@ \\n\" ; exit 1}
     eof { }
}" >> script1.sh

