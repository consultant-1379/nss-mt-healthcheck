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

import com.ericsson.cifwk.taf.annotations.*;
import com.ericsson.cifwk.taf.data.Host;
import com.ericsson.oss.testware.hostconfigurator.HostConfigurator;
import com.google.common.base.Joiner;

/**
 * NSS operator used to retrieve host information from DMT via TAF HostConfigurator.
 */
@Operator(context = { Context.REST, Context.UNKNOWN })
@VUserScoped
public class HostOperator {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * Retrieves a Host for the NETSim host, attached to a DMT deployment, by name.
     *
     * @param hostName
     *            the name of NETSim host
     * @return the Host given by hostName
     * @exception IllegalArgumentException
     *                if NETSim host name is not in DMT
     */
    public Host getNetsimHostByName(final String hostName) {
        final List<Host> netsimHosts = HostConfigurator.getAllNetsimHosts();

        Host netsimHost = null;
        logger.info("Iterating through all NETSim hosts: {}", formatHostsToListOfNames(netsimHosts));
        for (final Host host : netsimHosts) {
            if (host.getHostname().equalsIgnoreCase(hostName)) {
                logger.info("Found host that matches input: \"{}\" = \"{}\"", host.getHostname(), hostName);
                netsimHost = host;
                break;
            }
        }
        if (netsimHost == null) {
            throw new IllegalArgumentException("No NETSim host has been found that matches: " + hostName);
        }

        return netsimHost;
    }

    private String formatHostsToListOfNames(final List<Host> hosts) {
        final String commaSeparatedHosts = Joiner.on(", ").join(getHostnamesFromHosts(hosts));
        return String.format("[%s]", commaSeparatedHosts);
    }

    private ArrayList<String> getHostnamesFromHosts(final List<Host> hosts) {
        final ArrayList<String> hostnames = new ArrayList<>();
        for (final Host host : hosts) {
            hostnames.add(host.getHostname());
        }
        return hostnames;
    }
}
