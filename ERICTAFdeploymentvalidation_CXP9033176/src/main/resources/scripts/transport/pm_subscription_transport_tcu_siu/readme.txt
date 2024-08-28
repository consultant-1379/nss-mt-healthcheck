PM SYNC CAPABILITY FOR TRANSPORT NODES

1) Run getNodes.sh - which will fetch all started nodes and save them in allNodes file.
So make sure you have started only transport nodes on the VM

2) Run  capabilityFinder.sh <INIT_NUM_NODES> <STEP_NODES> <DEST> <DEST_PATH> <START_FAIL_ROP> <MAX_FAIL_ROP> - generates result.csv file

INIT_NUM_NODES - initial number of nodes on which usecases has to be started
STEP_NODES - how many more nodes to be added to usecase after a success pass
DEST - destination machine IP Address
DEST_PATH - file upload path for destination machine
START_FAIL_ROP - Number of ROPs to be failed before each suceess ROP
MAX_FAIL_ROP - Max number of Fail ROPs ( Step size is 1 by default )

- Finds number of files transferred for a given ROP
