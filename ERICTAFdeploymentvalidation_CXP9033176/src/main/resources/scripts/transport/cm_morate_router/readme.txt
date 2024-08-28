CM SYNC CAPABILITY FOR TRANSPORT NODES

1) Run getNodes.sh - which will fetch all started nodes and save them in allNodes file.
So make sure you have started only transport nodes on the VM

2) Run capabilityFinder.sh <Start> <Step> <Req_MORate> - generates result.csv file

Start - how many nodes to start with usecase
Step - if current nodes passes req mo rate , how many more nodes to include in next run 
Req MORate - expected morate/sec from every node

which will connect nodes and perform sync on given number of nodes 
if passes, increase num nodes by step untill req morate fails or all started nodes on VM passes(num rows in allNodes file)

