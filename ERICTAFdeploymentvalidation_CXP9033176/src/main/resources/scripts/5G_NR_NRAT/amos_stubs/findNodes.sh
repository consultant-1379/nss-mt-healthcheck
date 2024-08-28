#!/bin/bash
#===================================================================================
#
# FILE: findNode.sh
#
# USAGE: NA
#
# DESCRIPTION:  Will redirect all the dg2 node to a file
#
# NOTES: ---
# AUTHOR: ZKIDPIY (piyush.kidambi@tcs.com)
# VERSION: 1.0
# CREATED:
#
#===================================================================================


filename="tempFile.txt"
outFile="outfile.txt"
allNodes="allNodes.txt"

echo ".show started" >> $filename
~/inst/netsim_shell < $filename | tee -a $outFile

grep -nri "NR" $outFile | awk '{print $2 " " $3}' > $allNodes

rm -rf $outFile
rm -rf $filename

