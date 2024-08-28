PM SYNC CAPABILITY FOR TRANSPORT NODES - Max number of nodes on which PM Sync can be  performed in second.

1) Run getNodes.sh - which will fetch all started nodes and save them in allNodes file.
So make sure you have started only transport nodes on the VM

2) Run sh capabilityFinder.sh <TYPE> <START> <STEP> - generates result.csv file

TYPE - type of node mgw/rbs/rnc
START - no.of nodes to start with for subscription
Step - if current nodes passes in the given second , how many more nodes to include in next run 


