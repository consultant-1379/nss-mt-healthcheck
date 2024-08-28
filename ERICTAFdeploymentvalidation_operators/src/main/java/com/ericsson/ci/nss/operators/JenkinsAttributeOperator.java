/*------------------------------------------------------------------------------
 *******************************************************************************
 * COPYRIGHT Ericsson 2016
 *
 * The copyright to the computer program(s) herein is the property of
 * Ericsson Inc. The programs may be used and/or copied only with written
 * permission from Ericsson Inc. or in accordance with the terms and
 * conditions stipulated in the agreement/contract under which the
 * program(s) have been supplied.
 *******************************************************************************
 *----------------------------------------------------------------------------*/
package com.ericsson.ci.nss.operators;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ericsson.cifwk.taf.annotations.Context;
import com.ericsson.cifwk.taf.annotations.Operator;
import com.ericsson.cifwk.taf.annotations.VUserScoped;
import com.ericsson.cifwk.taf.data.DataHandler;

/**
 * NSS operator used to retrieve SUT attributes/properties defined via Jenkins job.
 */
@Operator(context = { Context.CLI, Context.UNKNOWN })
@VUserScoped
public class JenkinsAttributeOperator {

    private List<String> hostNames = null;

    private final Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * Retrieve NETSim host names as defined by Jenkins job
     *
     * @return list of NETSim host names
     */
    public List<String> getNetsimHostNames() {
        if (hostNames == null) {
            populateHostNames();
        }
        return hostNames;
    }

    private void populateHostNames() {
        hostNames = new ArrayList<String>();
        int netsimCount = 1;

        // This makes the assumption that (Jenkins build) parameters for NETSim hosts are of the form "serverName_#"
        while (DataHandler.getAttribute("serverName_" + netsimCount) != null) {
            final String hostName = DataHandler.getAttribute("serverName_" + netsimCount).toString().trim();
            logger.info("Adding {} to list of NETSim vm host names", hostName);
            hostNames.add(hostName);
            netsimCount++;
        }
    }
}
