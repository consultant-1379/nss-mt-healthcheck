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
package com.ericsson.ci.nss.test;

import static com.ericsson.cifwk.taf.scenario.TestScenarios.runner;
import static com.ericsson.cifwk.taf.scenario.TestScenarios.scenario;

import javax.inject.Inject;

import org.testng.annotations.Test;

import com.ericsson.ci.nss.test.flows.PreRolloutFlows;
import com.ericsson.cifwk.taf.TafTestBase;
import com.ericsson.cifwk.taf.annotations.Context;
import com.ericsson.cifwk.taf.annotations.TestId;
import com.ericsson.cifwk.taf.scenario.TestScenario;
import com.ericsson.cifwk.taf.scenario.TestScenarioRunner;
import com.ericsson.cifwk.taf.scenario.api.ExceptionHandler;
import com.ericsson.cifwk.taf.scenario.impl.LoggingScenarioListener;

/**
 * Holds test cases for NSS pre-rollout.
 */
public class PreRolloutTest extends TafTestBase {

    private static final String NSS_TEST_TITLE = "Common - Pre-Rollout Checks";
    private static final String NSS_SCENARIO = "CommonPreRolloutChecksScenario";
    private static final long TEST_TIMEOUT_IN_MILLISECONDS = 300000; // 5 minutes

    @Inject
    private PreRolloutFlows preRolloutFlows;

    /**
     * Test case to verify the correct configuration of NETSim hosts prior to simulation rollout.
     */
    @Context(context = Context.REST)
    @TestId(title = NSS_TEST_TITLE)
    @Test(timeOut = TEST_TIMEOUT_IN_MILLISECONDS)
    public void verifyNetsimHostConfiguration() {
        final TestScenario preCheckScenario = scenario(NSS_SCENARIO)
                .addFlow(preRolloutFlows.getPreRolloutNetsimFlow())
                .withTestStepExceptionHandler(ExceptionHandler.PROPAGATE)
                .build();

        getRunner().start(preCheckScenario);
    }

    private TestScenarioRunner getRunner() {
        return runner()
                .withListener(new LoggingScenarioListener())
                .withExceptionHandler(ExceptionHandler.PROPAGATE)
                .build();
    }
}
