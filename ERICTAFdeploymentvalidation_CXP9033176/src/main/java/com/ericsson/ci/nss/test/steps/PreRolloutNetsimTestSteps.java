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
package com.ericsson.ci.nss.test.steps;

import java.util.List;

import javax.inject.Inject;

import com.ericsson.ci.nss.operators.HostOperator;
import com.ericsson.ci.nss.operators.JenkinsAttributeOperator;
import com.ericsson.ci.nss.operators.NetsimHostOperator;
import com.ericsson.cifwk.taf.annotations.TestStep;
import com.ericsson.cifwk.taf.data.Host;

/**
 * Test steps for verifying the configuration of a NETSim host.
 */
public class PreRolloutNetsimTestSteps {

    public static final String TEST_STEP_VERIFY_UPTIME = "Test Step - Verify Uptime";
    private static final int MAX_UPTIME_DAYS = 10;

    @Inject
    private JenkinsAttributeOperator jenkinsAttributeOperator;

    @Inject
    private HostOperator hostOperator;

    @Inject
    private NetsimHostOperator netsimOperator;

    /**
     * Checks that the days since host has last been rebooted does not exceed max number of days.
     */
    @TestStep(id = TEST_STEP_VERIFY_UPTIME)
    public void verifyUptime() throws AssertionError {
        final List<String> hostNames = jenkinsAttributeOperator.getNetsimHostNames();

        final StringBuilder hostsInErrorState = new StringBuilder();
        for (final String hostName : hostNames) {
            final Host netsimHost = hostOperator.getNetsimHostByName(hostName);
            final int uptimeInDays = netsimOperator.getUptimeInDays(netsimHost);

            if (uptimeInDays >= MAX_UPTIME_DAYS) {
                hostsInErrorState.append(String.format("%n[%s]: Uptime (%s days) is greater than %s days.", hostName, uptimeInDays, MAX_UPTIME_DAYS));
            }
        }

        if (hostsInErrorState.length() > 0) {
            throw new AssertionError(hostsInErrorState);
        }

    }

}
