#!/bin/bash 

echo "spawn snmpbulkget -v 2c  -Cr20 -r 0 -t 3 -c \$COMMUNITY \$NODEIP:\$PORT $@" >> script1.sh
echo "expect {
    -re \"Timeout: No Response from\" { send_user \"Timedout in bulkget table $@ \\n\" ; exit 1}
     eof { }
}" >> script1.sh

