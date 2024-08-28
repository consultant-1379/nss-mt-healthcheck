
/usr/bin/expect << EOF

spawn snmpget -r 0 -t 3 -v 2c -c public $1 1.3.6.1.2.1.1.2.0
expect {
    -re "Timeout: No Response from" { send_user "Timedout in get request \n" ; exit 1}
     eof { }
}
EOF
