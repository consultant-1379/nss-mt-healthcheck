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
package com.ericsson.ci.nss.test.flows;

import static com.ericsson.cifwk.taf.scenario.TestScenarios.annotatedMethod;
import static com.ericsson.cifwk.taf.scenario.TestScenarios.flow;

import javax.inject.Inject;

import com.ericsson.ci.nss.test.steps.PreRolloutNetsimTestSteps;
import com.ericsson.cifwk.taf.scenario.TestStepFlow;

/**
 * Provides test flows that performs validation pre-rollout of NSS product set.
 */
public class PreRolloutFlows {

    private static final String NSS_HOST_FLOW = "NETSim Host Flow";

    @Inject
    private PreRolloutNetsimTestSteps preRolloutNetsimTestSteps;

    /**
     * Flow for NSS checks executed on NETSim hosts pre-rollout
     */
    public TestStepFlow getPreRolloutNetsimFlow() {
        return flow(NSS_HOST_FLOW)
                .addTestStep(annotatedMethod(preRolloutNetsimTestSteps, PreRolloutNetsimTestSteps.TEST_STEP_VERIFY_UPTIME))
                .build();
    }

}
