/*
 * ------------------------------------------------------------------------------
 * ******************************************************************************
 * COPYRIGHT Ericsson 2016
 * The copyright to the computer program(s) herein is the property of
 * Ericsson Inc. The programs may be used and/or copied only with written
 * permission from Ericsson Inc. or in accordance with the terms and
 * conditions stipulated in the agreement/contract under which the
 * program(s) have been supplied.
 * ******************************************************************************
 * ----------------------------------------------------------------------------
 */

package com.ericsson.ci.nss.operators;

import java.net.InetAddress;
import java.net.UnknownHostException;

import com.ericsson.cifwk.taf.data.Host;
import com.ericsson.cifwk.taf.data.User;
import com.ericsson.cifwk.taf.data.UserType;


/**
 * Host to replicate customer client that connects to ENM over NBI.
 */
public class logHost {

    protected static final String ROOT_USERNAME = "root";
    protected static final String ROOT_PW = "shroot";
    protected static final String VAPP_GW = "vapp_gw";
    protected static final String VAP_GW_IP = "192.168.0.1";
    private final String hostIp;
    private final String hostName;

    /**
     * NbiClientHost Class that determines where tests are running and creates the NBI client host accordingly
     * based on the hostname and IP of where the tests are running.
     * @throws UnknownHostException
     *             exception
     */
    public logHost() throws UnknownHostException {
        this(InetAddress.getLocalHost().getHostName(), InetAddress.getLocalHost().getHostAddress());
    }

    logHost(final String hostName, final String hostIp) {
        this.hostName = VAPP_GW;
        this.hostIp = VAP_GW_IP;
    }

    /**
     * getHost the logHost host to be used in NBI testing.
     * @return Host parameter
     */
    public Host getHost() {
        return Host.builder().withName(hostName).withIp(hostIp).withSshPort().withUser(new User(ROOT_USERNAME, ROOT_PW, UserType.ADMIN)).build();
    }
}
