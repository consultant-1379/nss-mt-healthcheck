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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ericsson.cifwk.taf.annotations.Context;
import com.ericsson.cifwk.taf.annotations.Operator;
import com.ericsson.cifwk.taf.annotations.VUserScoped;
import com.ericsson.cifwk.taf.data.Host;
import com.ericsson.cifwk.taf.data.User;
import com.ericsson.cifwk.taf.data.UserType;
import com.ericsson.cifwk.taf.tools.cli.CLICommandHelper;

/**
 * NSS operator used to execute commands in the shell of a NETSim host.
 */
@Operator(context = { Context.REST, Context.UNKNOWN })
@VUserScoped
public class NetsimHostOperator {

    private static final String UPTIME_CMD = "uptime";
    private static final String NETSIM_USERNAME = "netsim";
    private static final String NETSIM_PASSWORD = "netsim";
    private static final UserType NETSIM_USERTYPE = UserType.ADMIN;

    private final Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * Check the NETSim hosts uptime for number of days since the last reboot.
     *
     * @param netsimHost
     *            a Host object representing the NETSim host
     * @return an integer number of days
     */
    public int getUptimeInDays(final Host netsimHost) {
        logger.info("Getting the uptime for NETSim HOST: {}", netsimHost.getHostname());
        final String cliResult = executeCommand(netsimHost, UPTIME_CMD);

        final String numberOfDays = parseUptimeString(cliResult);
        final int uptimeInDays = Integer.parseInt(numberOfDays);
        logger.info("Uptime: {} days up", uptimeInDays);

        return uptimeInDays;
    }

    private String parseUptimeString(final String uptime) {
        final String numberOfDays;
        if (uptime.contains("days")) {
            final String[] tokens = uptime.split(" ");
            numberOfDays = tokens[4];
        } else {
            numberOfDays = "0";
        }
        return numberOfDays;
    }

    private String executeCommand(final Host netsimHost, final String cmd) {
        final CLICommandHelper netsimCli = new CLICommandHelper(netsimHost, new User(NETSIM_USERNAME, NETSIM_PASSWORD, NETSIM_USERTYPE));
        logger.info("Executing command: \"{}\"", UPTIME_CMD);
        final String cliResult = netsimCli.execute(cmd);

        final String stdOut = netsimCli.getStdOut().trim();
        logger.info("Command output is: \"{}\"", stdOut);
        final long execTime = netsimCli.getCommandExecutionTime();
        logger.debug("Execution time is: {} seconds", ((double) execTime) / 1000);

        netsimCli.disconnect();
        return cliResult;
    }

}
