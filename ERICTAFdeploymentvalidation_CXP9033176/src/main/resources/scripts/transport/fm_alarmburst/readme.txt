FM ALARM RATE CAPABILITY FOR TRANSPORT NODES

1) Run getNodes.sh - which will fetch all started nodes and save them in allNodes file.
So make sure you have started only transport nodes on the VM

# For Average Test - Find max number of nodes that can send given frequency in a second

2) Run AverageTester.sh <NumStartNodes> <StepToIncreaseNodes> <FrequencyStep> - adds result.csv file

Start - how many nodes to start with usecase
Step - if current nodes passes , how many more nodes to include in next run 
FrequecnyStep - if current nodes fails, how much frequency to be added to start from beginning


# Max Alarms that can be sent by a node and also VM

3)sh MaxFrequencyPerNodeAndVmFinder.sh - adds results to result.csv


 
