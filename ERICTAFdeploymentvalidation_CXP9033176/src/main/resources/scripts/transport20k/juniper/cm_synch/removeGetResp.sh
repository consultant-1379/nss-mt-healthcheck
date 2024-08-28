#!/bin/bash

#rm -rf Netsimprm*
#rm -rf Prmn*

#sh generaterequestprmn.sh
#sh generateresponseprmn.sh

#PRMN_REQUEST="/netsim/inst/netsimprmn/"$(ls -Art /netsim/inst/netsimprmn | tail -n 2 | grep .log)
#PRMN_RESPONSE="/netsim/inst/prmnresponse/"$(ls -Art /netsim/inst/prmnresponse | tail -n 2| grep .resp)

#cat $PRMN_RESPONSE
vim -e - $1 <<@@@
g/1.3.6.1.2.1.1.2.0/.-2,.d
wq
@@@


