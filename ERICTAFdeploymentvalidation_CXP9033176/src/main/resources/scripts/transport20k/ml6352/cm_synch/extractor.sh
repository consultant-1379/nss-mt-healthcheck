#!/bin/bash

rm -rf Netsimprm*
rm -rf Prmn*

sh generaterequestprmn.sh
sh generateresponseprmn.sh

PRMN_REQUEST="/netsim/inst/netsimprmn/"$(ls -Art /netsim/inst/netsimprmn | tail -n 2 | grep .log)
PRMN_RESPONSE="/netsim/inst/prmnresponse/"$(ls -Art /netsim/inst/prmnresponse | tail -n 2| grep .resp)

REQUEST_FILE="request.txt"
RESPONSE_FILE="response.txt"

sh extractrequest.sh ${PRMN_REQUEST} request.txt &
sh extractresponse.sh ${PRMN_RESPONSE} response.txt &

# Wait till extraction completed
wait

