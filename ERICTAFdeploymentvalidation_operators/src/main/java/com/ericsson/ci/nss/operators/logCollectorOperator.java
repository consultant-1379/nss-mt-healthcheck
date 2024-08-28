package com.ericsson.ci.nss.operators;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ericsson.ci.nss.utils.HostHandler;
import com.ericsson.ci.nss.utils.TafFileUtils;
import com.ericsson.ci.nss.utils.ZipUtility;
import com.ericsson.cifwk.taf.data.DataHandler;
import com.ericsson.cifwk.taf.data.Host;
import com.ericsson.cifwk.taf.data.User;
import com.ericsson.cifwk.taf.data.UserType;
import com.ericsson.cifwk.taf.tools.cli.handlers.impl.RemoteObjectHandler;
import com.ericsson.cifwk.taf.tools.cli.CLICommandHelper;
import com.google.inject.Singleton;
import com.ericsson.oss.testware.hostconfigurator.HostConfigurator;
import com.ericsson.ci.nss.operators.logHost;
import java.net.UnknownHostException;

/**
 * @author qfatonu
 *
 */
@Singleton

public class logCollectorOperator implements logCollectorScriptExecutionOperator {
    /** Remote host where scripts going to be executed */
	// private static Host host = null;
	

 //private static final String hostName = host.toString();
     //private static final String masterServerIp = HostHandler.getMasterServerIp();  
    
    
    //private static final String hostName = host.toString();
	//private static final String hostName = DataHandler.getAttribute("hostname").toString().concat(".athtem.eei.ericsson.se");
	//private static final String hostName = DataHandler.getHostByName(GATEWAY);
	//private static String hostNam = "NETSIM " + hostName;
	//private static final String GATEWAY=DataHandler.getAttribute("hostname").toString();
	//private static final String GATEWAY= "141.137.173.18";
//    private static final Host host = DataHandler.getHostByName(GATEWAY)

    public static logHost loghost = getLogHost();
    private static final Host host = loghost.getHost();
	
    private static final String hostName = host.toString();
    //private static final String masterServerIp = HostHandler.getMasterServerIp();

    /** Remote file location in unix format */
    private static final String REMOTE_FOLDER_TAF_SCRIPTS_LOCATION = "/var/simnet/HC/enm-ni-simdep";

    /** Local folder for embedded scripts */
    private static final String LOCAL_FOLDER_SCRIPTS_LOCATION = "scripts";

    /** Local zip folder for zipped embedded scripts */
    private static final String LOCAL_FOLDER_ZIP_FILES_LOCATION = "zips";

    /** Regular expression search term to find jar file list in Jenkins */
    private static final String JENKINS_JAR_FILE_SEARCH_TERM = ".jar";

    /** Regular expression search term to find enm_ni_simdep jar file in Jenkins */
    private static final String JENKINS_ENM_NI_SIMDEP_JAR_FILE_SEARCH_TERM = "lib.*CXP9033176";

    /** Local zip file name for zipped embedded scripts */
    private static final String ZIP_FILE_NAME = "enm-ni-simdep.zip";

    /** Logging utility */
    private static final Logger logger = LoggerFactory.getLogger(logCollectorOperator.class);

    /** Taf command handler instance */
    private CLICommandHelper cliCmdHelper;

    /** method to get hostname**/	
	public static logHost getLogHost(){
	try {
        return new logHost();	 
 } catch (final UnknownHostException e) {
          System.out.println("INFO: UnknownHostException");
  }
  return null;
}
    /**
     * Constructs a logCollectorOperator instance
     */
    public logCollectorOperator() {
        cliCmdHelper = new CLICommandHelper(host);
    }

    /**
     * Prepare prerequisite test execution environment before test execution start.
     *
     *
     * @return true if initial setup is successful, otherwise false
     */
    public static boolean initialise() {
       // logger.info("hostname osssssss " + hostNam);
        logger.info("host:" + host.toString());

        try {
            // Setup cmd and file handlers
            CLICommandHelper.DEFAULT_COMMAND_TIMEOUT_VALUE = 3600L * 4;
            final CLICommandHelper cliComandHelper = new CLICommandHelper(host);

            try {
                return setUpRemoteServerFolder(cliComandHelper) && copyScriptsFolderToRemoteServer(cliComandHelper)
                        && setUpRemoteFolderPermission(cliComandHelper) && convertRemoteFolderFilesDosToUnix(cliComandHelper);
            } finally {
                cliComandHelper.disconnect();
            }
        } catch (final Exception e) {
            logger.error("Error occured while initialising the TAF env. \n", e);
            return false;
        }

    }

    private static boolean setUpRemoteServerFolder(final CLICommandHelper cliComandHelper) {
        // Set up remote folder
        final String remoteFolderSetupOutput;
        final User user = host.getUsers(UserType.ADMIN).get(0);
        user.setUsername("root");
        user.setPassword("shroot");
        cliComandHelper.newHopBuilder().hop(user).build();
        cliComandHelper.execute("mkdir -v -p /var/HC/enm-ni-simdep");
        final String changeOwnerSetupOutput = cliComandHelper.getStdOut();
        logger.info("changeOwnerSetupOutput={}", changeOwnerSetupOutput);
        final int changeOwnerSetupCmdExitCode = cliComandHelper.getCommandExitValue();
        logger.info("changeOwnerSetupCmdExitCode={} ", changeOwnerSetupCmdExitCode);
        //cliComandHelper.disconnect(); // disconnect from the hop shell
        if (changeOwnerSetupCmdExitCode != 0) {
            return false;
        }

        cliComandHelper.newHopBuilder().hop(user).build();
        final String cmd01 = "rm -rf " + REMOTE_FOLDER_TAF_SCRIPTS_LOCATION + "; mkdir -p " + REMOTE_FOLDER_TAF_SCRIPTS_LOCATION;
        remoteFolderSetupOutput = cliComandHelper.execute(cmd01);
        //logger.info("remoteFolderSetupOutput={}", remoteFolderSetupOutput);
        final int remoteFolderSetupCmd01ExitCode = cliComandHelper.getCommandExitValue();
        logger.info("remoteFolderSetupCmd01ExitCode={}", remoteFolderSetupCmd01ExitCode);
        if (remoteFolderSetupCmd01ExitCode != 0) {
            return false;
        }
        return true;
    }

    private static boolean copyScriptsFolderToRemoteServer(final CLICommandHelper cliComandHelper) {
        final User user = host.getUsers(UserType.ADMIN).get(0);
        user.setUsername("root");
        user.setPassword("shroot");
        final RemoteObjectHandler remoteFileHandler = new RemoteObjectHandler(host, user);

        // Create a zip file to pack all the local scripts
        String zipFile;
        String localFolderScriptsLocation;
        String currentPath;
        try {

            final Path currentRelativePath = Paths.get("");
            currentPath = currentRelativePath.toAbsolutePath().toString();
            logger.debug("currentPath: {}", currentPath);

            if (Pattern.compile("testware").matcher(currentPath).find()) {
                zipFile = TafFileUtils.getNewFilePath(LOCAL_FOLDER_ZIP_FILES_LOCATION, ZIP_FILE_NAME);
                localFolderScriptsLocation = TafFileUtils.getFilePath(LOCAL_FOLDER_SCRIPTS_LOCATION);
                logger.debug("1-localFolderScriptsLocation: {}", localFolderScriptsLocation);

            } else {
                zipFile = TafFileUtils.getNewFilePath(currentPath, ZIP_FILE_NAME);

                // Search all jar files and return a file name contains lib and CXP9031884 words.
                final String simdepJarFile = TafFileUtils.getFilePath(JENKINS_JAR_FILE_SEARCH_TERM, JENKINS_ENM_NI_SIMDEP_JAR_FILE_SEARCH_TERM);
                logger.debug("simdepJarFile:{}", simdepJarFile);

                final String destUnzipFolderName = "ENM-NI-SIMDEP";
                final String destUnzipFolder = TafFileUtils.getNewFilePath(currentPath, destUnzipFolderName);
                logger.debug("destUnzipFolder: {}", destUnzipFolder);
                ZipUtility.unzip(simdepJarFile, destUnzipFolder);
                logger.debug("Unzipping completed for file: {} |", simdepJarFile);

                localFolderScriptsLocation = destUnzipFolder + "/scripts";
                logger.debug("1-localFolderScriptsLocation: {}", localFolderScriptsLocation);
            }
            logger.debug("zipFile: {}", zipFile);
            ZipUtility.zip(zipFile, localFolderScriptsLocation);

        } catch (final IOException e) {
            logger.error("Unable to to zip/unzip the file: ", e);
            return false;
        }

        // Copy local files to remote location
        try {
            logger.debug("Start copying zipFile:{} to remote server", zipFile);
            final boolean filesCopied = remoteFileHandler.copyLocalFileToRemote(zipFile, REMOTE_FOLDER_TAF_SCRIPTS_LOCATION, currentPath);
            logger.info("filesCopied={}", filesCopied);
            if (!filesCopied) {
                return false;
            }

        } catch (final Exception e) {
            logger.error("Unable to locate scripts path ", e);
            return false;
        }

        // Unzip the zip file remotely
        final String cmd02 = "whoami; cd " + REMOTE_FOLDER_TAF_SCRIPTS_LOCATION + "; unzip " + ZIP_FILE_NAME + "; unzip -t " + ZIP_FILE_NAME;
        final String unzipOutput = cliComandHelper.execute(cmd02);

        logger.info("convertionOutput3={}", unzipOutput);
        final int unzipCmd02ExitCode = cliComandHelper.getCommandExitValue();
        logger.info("unzipCmd02ExitCode={}", unzipCmd02ExitCode);

        if (unzipCmd02ExitCode != 0) {
            return false;
        }

        return true;
    }

    private static boolean setUpRemoteFolderPermission(final CLICommandHelper cliComandHelper) {
        // Set up the remote file||folder permissions under unix
        final User user = host.getUsers(UserType.ADMIN).get(0);
        user.setUsername("root");
        user.setPassword("shroot");
        final String cmd03 = "whoami; cd " + REMOTE_FOLDER_TAF_SCRIPTS_LOCATION + "; chmod -R +x * ";
        logger.info("Switching to admin user {}", user.toString());
        cliComandHelper.newHopBuilder().hop(user).build();
        cliComandHelper.execute(cmd03);
        final String filePermissionSetupOutput = cliComandHelper.getStdOut();
        logger.info("filePermissionSetupOutput={}", filePermissionSetupOutput);
        final int filePermissionSetupCmd03ExitCode = cliComandHelper.getCommandExitValue();
        logger.info("filePermissionSetupCmd03ExitCode={}", filePermissionSetupCmd03ExitCode);
        // cliComandHelper.disconnect(); // disconnect from the hop shell
        if (filePermissionSetupCmd03ExitCode != 0) {
            return false;
        }
        return true;
    }

    private static boolean convertRemoteFolderFilesDosToUnix(final CLICommandHelper cliComandHelper) {
        // Convert dos files into unix format on remote server
        final String convertionOutput;
        final String cmd04 = "whoami ; cd " + REMOTE_FOLDER_TAF_SCRIPTS_LOCATION + "; perl -i -pe 's/\\r//g' `find . -print | egrep -i 'sh|pl|txt'`";
        convertionOutput = cliComandHelper.execute(cmd04);
        logger.info("convertionOutput= {}", convertionOutput);
        final int convertionCmd04ExitCode = cliComandHelper.getCommandExitValue();
        logger.info("convertionCmd04ExitCode = {}", convertionCmd04ExitCode);
        if (convertionCmd04ExitCode != 0) {
            return false;
        }
        return true;
    }

    @Override
    public int verifyScriptExecution(final String command) {
		String JobType, allureReport, ClusterId, NoOfDays, clusterId, select_the_Hour, netsimHostnames;
        final User user = host.getUsers(UserType.ADMIN).get(0);
        user.setUsername("root");
        user.setPassword("shroot");
        final String debugCommandsOutput;
        		
	    try {
		netsimHostnames = DataHandler.getAttribute("netsimHostnames").toString();
		if (netsimHostnames.isEmpty()) {
			netsimHostnames = " ";
		}
		} catch (NullPointerException npe) {
		logger.debug("netsimHostnames is null.");
		netsimHostnames = " ";
		} 
		
		
		try {
		select_the_Hour = DataHandler.getAttribute("select_the_Hour").toString();
		if (select_the_Hour.isEmpty()) {
			select_the_Hour = " ";
		}
		} catch (NullPointerException npe) {
		logger.debug("select_the_Hour is null.");
		select_the_Hour = " ";
		} 
		
		
		try {
		String Basis = DataHandler.getAttribute("Basis").toString();
		if (Basis.isEmpty()) {
			Basis = " ";
		}
		} catch (NullPointerException npe) {
		logger.debug("Basis is null.");
		String Basis = " ";
		} 
		
		try {
		clusterId = DataHandler.getAttribute("clusterId").toString();
		if (clusterId.isEmpty()) {
			clusterId = " ";
		}
		} catch (NullPointerException npe) {
		logger.debug("clusterId is null.");
		clusterId = " ";
		} 
		
		try {
		NoOfDays = DataHandler.getAttribute("NoOfDays").toString();
		if (NoOfDays.isEmpty()) {
			NoOfDays = " ";
		}
		} catch (NullPointerException npe) {
		logger.debug("NoOfDays is null.");
		NoOfDays = " ";
		} 
		
        try {
            ClusterId = DataHandler.getAttribute("ClusterId").toString();
			if (ClusterId.isEmpty()) {
                ClusterId = " ";
            }
        } catch (final NullPointerException npe) {
            logger.debug("ClusterId is null.");
			ClusterId = " ";
        }
        
        try {
            allureReport = DataHandler.getAttribute("allureReport").toString();
			if (allureReport.isEmpty()) {
                allureReport = "null";
            }
        } catch (final NullPointerException npe) {
            logger.debug("allureReport is null.");
			allureReport = "null";
        }
        
        try {
            JobType = DataHandler.getAttribute("JobType").toString();
			if (JobType.isEmpty()) {
                JobType = "null";
            }
        } catch (final NullPointerException npe) {
            logger.debug("JobType is null.");
			JobType = "null";
        }		
        try {
            cliCmdHelper = new CLICommandHelper(host, user);

            if (logger.isDebugEnabled()) {
                final String debugCommands = "whoami";
                logger.debug("debugCommands to be executed: {}", debugCommands);
                if (!hostName.equals("UNKNOWN development-netsim") && !hostName.equals("UNKNOWN physical-or-vm-netsim")) {
                    debugCommandsOutput = cliCmdHelper.execute(debugCommands);
                } else {
                    debugCommandsOutput = cliCmdHelper.simpleExec(debugCommands);
                }
                logger.debug("debugCommandsOutput: {}", debugCommandsOutput);
            }
            // workAround to relative path within script
            // if script has a relative path reference within script
            // it will fail due to script is checking reference where the
            // script is executed
            if (command.contains("/")) {
                String tmpCommand = command;
                if (command.contains(" ")) {
                    final int endIndex = command.indexOf(" ");
                    tmpCommand = command.substring(0, endIndex);
                }
                final int endIndex = tmpCommand.lastIndexOf("/");
                final String commandPath = tmpCommand.substring(0, endIndex);
                final String cdToScriptLocationCmd = "cd " + commandPath;
                logger.debug("cdToScriptLocationCmd to be executed: {}", cdToScriptLocationCmd);
                // To leave the current shell open, here, execute command is used.
                // Hence, the script will be executed from the commandPath rather than a relative path.
                // In others words, the initial location for the next command will be the commandPath
                cliCmdHelper.execute(cdToScriptLocationCmd);
                final String commandPathOutput = cliCmdHelper.getStdOut();
                logger.debug("commandPathOutput: {}", commandPathOutput);
            }
			if (command.contains("nflogCollectorHourly.py")) {
			String tmp2 = command;
			System.out.println("************command is***********");
			System.out.println(tmp2);
			tmp2 = "python3 " + command;
			logger.info("Command to be executed: {}", tmp2.concat(" ").concat(clusterId).concat(" ").concat(netsimHostnames).concat(" ").concat(select_the_Hour));
			this.cliCmdHelper.simpleExec(new String[] { tmp2.concat(" ").concat(clusterId).concat(" ").concat(netsimHostnames).concat(" ").concat(select_the_Hour) });
			
			}
			else if (command.contains("nflogCollector.py")) {
			String tmp1 = command;
			System.out.println("************command is***********");
			System.out.println(tmp1);
			tmp1 = "python3 " + command;
			logger.info("Command to be executed: {}", tmp1.concat(" ").concat(clusterId).concat(" ").concat(netsimHostnames).concat(" ").concat(NoOfDays));
			this.cliCmdHelper.simpleExec(new String[] { tmp1.concat(" ").concat(clusterId).concat(" ").concat(netsimHostnames).concat(" ").concat(NoOfDays) });
			}
			else if (command.contains("collectLogs.py")) {
			logger.info("Command to be executed: {}", command.concat(" ").concat(netsimHostnames));
			this.cliCmdHelper.simpleExec(new String[] { command.concat(" ").concat(netsimHostnames) });
			
			}
           else if (command.contains("logCollector.sh")) {
                logger.info("Command to be executed: {}", command.concat(" ").concat(allureReport).concat(" ").concat(JobType).concat(" ").concat(ClusterId));
                cliCmdHelper.simpleExec(command.concat(" ").concat(allureReport).concat(" ").concat(JobType).concat(" ").concat(ClusterId));
            } else {				
                logger.info("Command to be executed: {}", command);
                cliCmdHelper.simpleExec(command);
            }

            final String output = cliCmdHelper.getStdOut();
            logger.info("Command output: {}", output);

            final int exitCode = cliCmdHelper.getCommandExitValue();
            logger.info("ExitCode:{}, command:\"{}\" ", exitCode, command);

            cliCmdHelper.disconnect();

            return exitCode;

        } catch (final Exception e) {
            logger.error("Error occured while executing command:{} \n", command, e);
            return Integer.MIN_VALUE;
        }

    }

    private String convertToPerlCmdArg(final String arg) {
        return arg.isEmpty() ? "\"\"" : arg;
    }
}
