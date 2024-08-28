#readme.txt
AlarmBurst Scalability Test

1) To seperate nodes according to netsim servers.
 sh seperate.sh

 2) Run executeMultiple.sh to execute alarmburst on the selected nodes.

 Usage: $0 <num_of_alarms> <num_of_nodes> <loops consider_all_servers(yes/no)> <filename(not required if consider_all_servers=yes)> <frequency>

 Ex - 
 a) sh executeMultiple.sh 100 10 1 no server_00187_LTE_MSRBS-V2_17-Q4-V2@ieatnetsimv5109-54.txt 100

 b) sh executeMultiple.sh 100 10 1 yes 100
