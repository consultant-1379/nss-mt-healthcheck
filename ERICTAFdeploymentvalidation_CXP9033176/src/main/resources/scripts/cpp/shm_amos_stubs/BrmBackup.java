// just import standard stuff to write shorter names later
import java.util.*;
import org.omg.CORBA.*;
import org.omg.CosNaming.*;
import java.util.concurrent.TimeUnit;
import org.omg.PortableServer.*;
import org.omg.PortableServer.POA;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Properties;


// import the generated code (from the previous step). This file should be in the same
// directory as the IDLs, otherwise won't found these packages.
import BasicConfig.*;
import Config.*;

public class BrmBackup {
    static ConfigExtended.NotificationConsumer cons;
    public static void main(String[] args) {
        try {

            String nodeName = args[7];
            String simName = args[5];
            String nodeIp = args[3];
            String nodePort = args[1];

            File file = new File("cpp.properties");
            FileInputStream fileInput = new FileInputStream(file);
            Properties properties = new Properties();
            properties.load(fileInput);
            fileInput.close();

            long endTimeMillis;
            long createTimeout = Long.parseLong(properties.getProperty("CREATE_TIMEOUT"));
            long putToFtpTimeout = Long.parseLong(properties.getProperty("PUT_TO_FTP_TIMEOUT"));
            long setStartableTimeout = Long.parseLong(properties.getProperty("SET_STARTABLE_TIMEOUT"));
            long manualRestartTimeout = Long.parseLong(properties.getProperty("MANUAL_RESTART_TIMEOUT"));
            long deleteTimeout = Long.parseLong(properties.getProperty("DELETE_TIMEOUT"));
            long getFromFtpTimeout = Long.parseLong(properties.getProperty("GET_FROM_FTP_TIMEOUT"));
            long verifyRestoreTimeout = Long.parseLong(properties.getProperty("VERIFY_RESTORE_TIMEOUT"));
            long restoreTimeout = Long.parseLong(properties.getProperty("RESTORE_TIMEOUT"));
            long confirmRestoreTimeout = Long.parseLong(properties.getProperty("CONFIRM_RESTORE_TIMEOUT"));
            String testCvName1 = properties.getProperty("TEST_CV_NAME_1");
            String testCvName2 = properties.getProperty("TEST_CV_NAME_2");
            String testCvName =  testCvName1 + nodeName;
            String testCvNameNew = testCvName2 + nodeName;
            String backUpPath = properties.getProperty("BACKUPPATH");
            String ftpServer = properties.getProperty("FTPSERVER");
            String ftpUser = properties.getProperty("FTPUSER");
            String ftpPass = properties.getProperty("FTPPASS");

            boolean skip;
            skip = false;

            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

            // create the Orber
            ORB orb = ORB.init(args, new Properties());

            // resolve the NameService. Its parameters will be passed on the command line
            org.omg.CORBA.Object obj = orb.resolve_initial_references("NameService");
            NamingContextExt ncRef = NamingContextExtHelper.narrow(obj);
            System.out.println("Objnode:" + obj + "ncRef:" + ncRef);
//            org.omg.CORBA.Object ccs = ncRef.resolve_str(simName + "_netsimdir_xgoumal_home/" + nodeName + "/CelloConfigurationService");
            org.omg.CORBA.Object ccs = ncRef.resolve_str(simName + "_netsimdir_netsim/" + nodeName + "/CelloConfigurationService");
            ConfigExtended.ConfigurationExtended conf = ConfigExtended.ConfigurationExtendedHelper.narrow(ccs);


//Subscribe

            // get reference to rootpoa & activate the POAManager
            POA rootpoa = POAHelper.narrow(orb.resolve_initial_references("RootPOA"));
            rootpoa.the_POAManager().activate();

            // create servant and register it with the ORB
            NotificationConsumerImpl consImpl = new NotificationConsumerImpl(nodeIp,nodePort);
            consImpl.setORB(orb);

            // get object reference from the servant
            org.omg.CORBA.Object ref = rootpoa.servant_to_reference(consImpl);
            ConfigExtended.NotificationConsumer cons = ConfigExtended.NotificationConsumerHelper.narrow(ref);

            System.out.println("cons:::::::" + cons);

            //Subscribe to the node
            String[] type1 = {};
            ConfigExtended.NotificationProducerPackage.NotificationFilter nfilter = new ConfigExtended.NotificationProducerPackage.NotificationFilter(type1,true,true,"",-1);
            int timetick1 = 3600;
            org.omg.CORBA.IntHolder id = new IntHolder(0);
            ConfigExtended.NotificationProducer np = conf.get_notification_producer();
            np.subscribe(cons,nfilter,timetick1,id);

            //Action: Create backup
            BasicConfig.BasicConfiguration sessObj1 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
            BasicConfig.Session sess1 = sessObj1.create_session("brm",600);
            String sessionId1 = sess1.get_session_id();
            System.out.println("Session id1 --" + sessionId1);
            CosNaming.NameComponent a1 = new CosNaming.NameComponent("ManagedElement=1","");
            CosNaming.NameComponent a2 = new CosNaming.NameComponent("SwManagement=1","");
            CosNaming.NameComponent a3 = new CosNaming.NameComponent("ConfigurationVersion=1","");
            BasicConfig.MOidpair basecvmo = new MOidpair();
            basecvmo.name(new CosNaming.NameComponent[] {a1,a2,a3});
            org.omg.CORBA.Any cvName = orb.create_any();
            cvName.insert_string(testCvName);
            org.omg.CORBA.Any identity = orb.create_any();
            identity.insert_string("");
            org.omg.CORBA.Any type = orb.create_any();
            type.insert_long(0);
            org.omg.CORBA.Any opName = orb.create_any();
            opName.insert_string("administrator");
            org.omg.CORBA.Any comment = orb.create_any();
            comment.insert_string("");

            BasicConfig.NameValue[] nvPar = {new BasicConfig.NameValue("configurationVersionName",cvName),new BasicConfig.NameValue("identity",identity), new BasicConfig.NameValue("type",type),new BasicConfig.NameValue("operatorName",opName), new BasicConfig.NameValue("comment",comment)};
            BasicConfig.NameValueSeqHolder parameters = new BasicConfig.NameValueSeqHolder(nvPar);
            consImpl.setBackupActivityStatus("activitystart");
            System.out.println("Triggering create cv action\n");
            conf.action(basecvmo,"create",parameters,sess1);
            endTimeMillis = System.currentTimeMillis() + createTimeout;
            while (!consImpl.getBackupActivityStatus().equals("activitycompleted") ) {
                if (System.currentTimeMillis() < endTimeMillis) {
                    TimeUnit.SECONDS.sleep(1);
                }
                else {
                    System.out.println("Timedout in create action");
                    System.exit(1);
                }
             }
             sess1.commit();
             sess1.end();
             Calendar cal1 = Calendar.getInstance();
             System.out.println("Backup state: CREATE BACKUP COMPLETED " + sdf.format(cal1.getTime()));

             BasicConfig.MOidpair cvmo = new MOidpair();
             cvmo.name(new CosNaming.NameComponent[] {a1,a2,a3});
             BasicConfig.NameValue[] cvnvpar = {};
             BasicConfig.NameValueSeqHolder attributes = new BasicConfig.NameValueSeqHolder(cvnvpar);
             String[] attributeNames =  {"currentMainActivity","currentDetailedActivity","currentUpgradePackage","storedConfigurationVersions","missingUpgradePackages","actionResult","additionalActionResultData","corruptedUpgradePackages","rollbackList","startableConfigurationVersion","currentLoadedConfigurationVersion","additionalActionResultData"};
             BasicConfig.Session sessnull = null;
             conf.basic_get_MO_attributes(cvmo,attributeNames,attributes,sessnull);
             System.out.println("Attributes" + attributes);

             //Action: PutToFtp
             BasicConfig.BasicConfiguration sessObj2 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
             BasicConfig.Session sess2 = sessObj2.create_session("brm2",280);

             String sessionId2 = sess2.get_session_id();
             System.out.println("Session id --" + sessionId2);

             BasicConfig.MOidpair cvmo1 = new MOidpair();
             cvmo1.name(new CosNaming.NameComponent[] {a1,a2,a3});

             org.omg.CORBA.Any cvName1 = orb.create_any();
             cvName1.insert_string(testCvName);
             org.omg.CORBA.Any pathOnFtpServer = orb.create_any();
             pathOnFtpServer.insert_string(backUpPath);
             org.omg.CORBA.Any cvBackupNameOnFtpServer = orb.create_any();
             cvBackupNameOnFtpServer.insert_string(testCvName);
             org.omg.CORBA.Any ftpServerIpAddress = orb.create_any();
             ftpServerIpAddress.insert_string(ftpServer);
             org.omg.CORBA.Any ftpServerUserId = orb.create_any();
             ftpServerUserId.insert_string(ftpUser);
             org.omg.CORBA.Any ftpServerPassword = orb.create_any();
             ftpServerPassword.insert_string(ftpPass);

             BasicConfig.NameValue[] putToFtpParam = {new BasicConfig.NameValue("cvName",cvName1),new BasicConfig.NameValue("pathOnFtpServer",pathOnFtpServer), new BasicConfig.NameValue("cvBackupNameOnFtpServer",cvBackupNameOnFtpServer),new BasicConfig.NameValue("ftpServerIpAddress",ftpServerIpAddress), new BasicConfig.NameValue("ftpServerUserId",ftpServerUserId),new BasicConfig.NameValue("ftpServerPassword",ftpServerPassword)};
             BasicConfig.NameValueSeqHolder putToFtpParameters = new BasicConfig.NameValueSeqHolder(putToFtpParam);
             System.out.println("Triggering putToFtpServer action\n");
             consImpl.setBackupActivityStatus("activitystart");
             consImpl.setBackupActionStatus("actionstart");
             conf.action(cvmo1,"putToFtpServer",putToFtpParameters,sess2);
             endTimeMillis = System.currentTimeMillis() + putToFtpTimeout;
             while (!(consImpl.getBackupActivityStatus().equals("activitycompleted") && consImpl.getBackupActionStatus().equals("actioncompleted"))) {
                if (System.currentTimeMillis() < endTimeMillis) {
                    TimeUnit.SECONDS.sleep(1);
                }
                else {
                    System.out.println("Timedout in put to FTP action");
                    System.exit(1);
                }
             }
             sess2.commit();
             sess2.end();
             Calendar cal2 = Calendar.getInstance();
             System.out.println("Backup state: PUT TO FTP COMPLETED " + sdf.format(cal2.getTime()));

             //Action: Set startable action
             BasicConfig.BasicConfiguration sessObj3 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
             BasicConfig.Session sess3 = sessObj3.create_session("brm3",280);

             String sessionId3 = sess3.get_session_id();
             System.out.println("Session id --" + sessionId3);

             BasicConfig.MOidpair cvmo2 = new MOidpair();
             cvmo2.name(new CosNaming.NameComponent[] {a1,a2,a3});

             org.omg.CORBA.Any configurationVersionName = orb.create_any();
             configurationVersionName.insert_string(testCvName);

             BasicConfig.NameValue[] setStartableParam = {new BasicConfig.NameValue("configurationVersionName",configurationVersionName)};
             BasicConfig.NameValueSeqHolder setStartableParameters = new BasicConfig.NameValueSeqHolder(setStartableParam);
             System.out.println("Triggering setStartable action\n");
             consImpl.setBackupActivityStatus("activitystart");
             conf.action(cvmo2,"setStartable",setStartableParameters,sess3);
             endTimeMillis = System.currentTimeMillis() + setStartableTimeout;
             while (!consImpl.getBackupActivityStatus().equals("activitycompleted")) {
                 if (System.currentTimeMillis() < endTimeMillis) {
                     TimeUnit.SECONDS.sleep(1);
                 }
                 else {
                    System.out.println("Timedout in setStartable action");
                    System.exit(1);
                 }
             }
             sess3.commit();
             sess3.end();
             Calendar cal3 = Calendar.getInstance();
             System.out.println("Backup state: SET STARTABLE COMPLETED " + sdf.format(cal3.getTime()));

             //Action: manual Restart
             BasicConfig.BasicConfiguration sessObj4 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
             BasicConfig.Session sess4 = sessObj4.create_session("brm4",280);

             String sessionId4 = sess4.get_session_id();
             System.out.println("Session id --" + sessionId4);

             BasicConfig.MOidpair memo = new MOidpair();
             memo.name(new CosNaming.NameComponent[] {a1});

             org.omg.CORBA.Any restartRank = orb.create_any();
             restartRank.insert_long(0);
             org.omg.CORBA.Any restartReason = orb.create_any();
             restartReason.insert_long(0);
             org.omg.CORBA.Any restartInfo = orb.create_any();
             String info = "Restart action triggered with cv " + testCvName;
             restartInfo.insert_string(info);

             BasicConfig.NameValue[] manualRestartParam = {new BasicConfig.NameValue("restartRank",restartRank),new BasicConfig.NameValue("restartReason",restartReason),new BasicConfig.NameValue("restartInfo",restartInfo) };
             BasicConfig.NameValueSeqHolder manualReStartParameters = new BasicConfig.NameValueSeqHolder(manualRestartParam);
             System.out.println("Triggering manual ReStart action\n");
             consImpl.setBackupActionStatus("actionstart");
             conf.action(memo,"manualReStart",manualReStartParameters,sess4);
             endTimeMillis = System.currentTimeMillis() + manualRestartTimeout;
             while (!consImpl.getBackupActionStatus().equals("actioncompleted") ) {
                 if (System.currentTimeMillis() < endTimeMillis) {
                     TimeUnit.SECONDS.sleep(1);
                 }
                 else {
                    System.out.println("Timedout in manual Restart action");
                    System.exit(1);
                 }
             }
             sess4.commit();
             sess4.end();
             Calendar cal4 = Calendar.getInstance();
             System.out.println("Backup state: MANUAL RESTART COMPLETED " + sdf.format(cal4.getTime()));
            //Action: Create backup
            BasicConfig.BasicConfiguration sessObj5 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
            BasicConfig.Session sess5 = sessObj5.create_session("brm5",600);
            String sessionId5 = sess5.get_session_id();
            System.out.println("Session id5 --" + sessionId5);

            BasicConfig.MOidpair basecvmonew = new MOidpair();
            basecvmonew.name(new CosNaming.NameComponent[] {a1,a2,a3});
            org.omg.CORBA.Any cvNameNew = orb.create_any();
            cvNameNew.insert_string(testCvNameNew);
            org.omg.CORBA.Any identityNew = orb.create_any();
            identityNew.insert_string("");
            org.omg.CORBA.Any typeNew = orb.create_any();
            typeNew.insert_long(0);
            org.omg.CORBA.Any opNameNew = orb.create_any();
            opNameNew.insert_string("administrator");
            org.omg.CORBA.Any commentNew = orb.create_any();
            commentNew.insert_string("");

            BasicConfig.NameValue[] nvParNew = {new BasicConfig.NameValue("configurationVersionName",cvNameNew),new BasicConfig.NameValue("identity",identityNew), new BasicConfig.NameValue("type",typeNew),new BasicConfig.NameValue("operatorName",opNameNew), new BasicConfig.NameValue("comment",commentNew)};
            BasicConfig.NameValueSeqHolder parametersNew = new BasicConfig.NameValueSeqHolder(nvParNew);
            consImpl.setBackupActivityStatus("activitystart");
            System.out.println("Triggering create cv action\n");
            conf.action(basecvmo,"create",parametersNew,sess5);
            endTimeMillis = System.currentTimeMillis() + createTimeout;
            while (!consImpl.getBackupActivityStatus().equals("activitycompleted") ) {
               if (System.currentTimeMillis() < endTimeMillis) {
                   TimeUnit.SECONDS.sleep(1);
               }
               else {
                   System.out.println("Timedout in create action");
                   System.exit(1);
               }
            }
            sess5.commit();
            sess5.end();
            Calendar cal5 = Calendar.getInstance();
            System.out.println("Backup state: CREATE BACKUP COMPLETED " + sdf.format(cal5.getTime()));

            BasicConfig.MOidpair cvmoNew = new MOidpair();
            cvmoNew.name(new CosNaming.NameComponent[] {a1,a2,a3});
            BasicConfig.NameValue[] cvnvparNew = {};
            BasicConfig.NameValueSeqHolder attributesNew = new BasicConfig.NameValueSeqHolder(cvnvparNew);
            String[] attributeNamesNew =  {"currentMainActivity","currentDetailedActivity","currentUpgradePackage","storedConfigurationVersions","missingUpgradePackages","actionResult","additionalActionResultData","corruptedUpgradePackages","rollbackList","startableConfigurationVersion","currentLoadedConfigurationVersion","additionalActionResultData"};
            conf.basic_get_MO_attributes(cvmoNew,attributeNamesNew,attributesNew,sessnull);
            System.out.println("Attributes" + attributesNew);

            //Action: PutToFtp
            BasicConfig.BasicConfiguration sessObj6 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
            BasicConfig.Session sess6 = sessObj6.create_session("brm6",280);

            String sessionId6 = sess6.get_session_id();
            System.out.println("Session id --" + sessionId6);

            BasicConfig.MOidpair cvmoNew1 = new MOidpair();
            cvmoNew1.name(new CosNaming.NameComponent[] {a1,a2,a3});

            org.omg.CORBA.Any cvNameNew1 = orb.create_any();
            cvNameNew1.insert_string(testCvNameNew);
            org.omg.CORBA.Any pathOnFtpServerNew = orb.create_any();
            pathOnFtpServerNew.insert_string(backUpPath);
            org.omg.CORBA.Any cvBackupNameOnFtpServerNew = orb.create_any();
            cvBackupNameOnFtpServerNew.insert_string(testCvNameNew);
            org.omg.CORBA.Any ftpServerIpAddressNew = orb.create_any();
            ftpServerIpAddressNew.insert_string(ftpServer);
            org.omg.CORBA.Any ftpServerUserIdNew = orb.create_any();
            ftpServerUserIdNew.insert_string(ftpUser);
            org.omg.CORBA.Any ftpServerPasswordNew = orb.create_any();
            ftpServerPasswordNew.insert_string(ftpPass);

            BasicConfig.NameValue[] putToFtpParamNew = {new BasicConfig.NameValue("cvName",cvNameNew1),new BasicConfig.NameValue("pathOnFtpServer",pathOnFtpServerNew), new BasicConfig.NameValue("cvBackupNameOnFtpServer",cvBackupNameOnFtpServerNew),new BasicConfig.NameValue("ftpServerIpAddress",ftpServerIpAddressNew), new BasicConfig.NameValue("ftpServerUserId",ftpServerUserIdNew),new BasicConfig.NameValue("ftpServerPassword",ftpServerPasswordNew)};
             BasicConfig.NameValueSeqHolder putToFtpParametersNew = new BasicConfig.NameValueSeqHolder(putToFtpParamNew);
             System.out.println("Triggering putToFtpServer action\n");
             consImpl.setBackupActivityStatus("activitystart");
             consImpl.setBackupActionStatus("actionstart");
             conf.action(cvmoNew1,"putToFtpServer",putToFtpParametersNew,sess6);
             endTimeMillis = System.currentTimeMillis() + putToFtpTimeout;
             while (!(consImpl.getBackupActivityStatus().equals("activitycompleted") && consImpl.getBackupActionStatus().equals("actioncompleted"))) {
                if (System.currentTimeMillis() < endTimeMillis) {
                    TimeUnit.SECONDS.sleep(1);
                }
                else {
                    System.out.println("Timedout in put to FTP action");
                    System.exit(1);
                }
             }
             sess6.commit();
             sess6.end();
             Calendar cal6 = Calendar.getInstance();
             System.out.println("Backup state: PUT TO FTP COMPLETED " + sdf.format(cal6.getTime()));
             //Action: Delete CV
             BasicConfig.BasicConfiguration sessObj7 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
             BasicConfig.Session sess7 = sessObj7.create_session("brm7",280);

             String sessionId7 = sess7.get_session_id();
             System.out.println("Session id --" + sessionId7);

             BasicConfig.MOidpair delcvmo = new MOidpair();
             delcvmo.name(new CosNaming.NameComponent[] {a1,a2,a3});

             org.omg.CORBA.Any delCvName = orb.create_any();
             delCvName.insert_string(testCvNameNew);

             BasicConfig.NameValue[] deleteCvParam = {new BasicConfig.NameValue("configurationVersionName",delCvName)};
             BasicConfig.NameValueSeqHolder deleteCvParameters = new BasicConfig.NameValueSeqHolder(deleteCvParam);
             System.out.println("Triggering delete CV action\n");
             consImpl.setBackupActivityStatus("activitystart");
             conf.action(delcvmo,"delete",deleteCvParameters,sess7);
             endTimeMillis = System.currentTimeMillis() + deleteTimeout;
             while (!consImpl.getBackupActivityStatus().equals("deletecompleted") ) {
                 if (System.currentTimeMillis() < endTimeMillis) {
                     TimeUnit.SECONDS.sleep(1);
                 }
                 else {
                    System.out.println("Timedout in delete CV action");
                    System.exit(1);
                 }
             }
             sess7.commit();
             sess7.end();
             Calendar cal7 = Calendar.getInstance();
             System.out.println("Backup state: DELETE CV COMPLETED " + sdf.format(cal7.getTime()));
             //Action: GetFromFtp
             BasicConfig.BasicConfiguration sessObj8 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
             BasicConfig.Session sess8 = sessObj8.create_session("brm8",280);

             String sessionId8 = sess8.get_session_id();
             System.out.println("Session id --" + sessionId8);

             BasicConfig.MOidpair getcvmo = new MOidpair();
             getcvmo.name(new CosNaming.NameComponent[] {a1,a2,a3});

             org.omg.CORBA.Any pathForCvBackupOnFtpServer = orb.create_any();
             String backupPath = "/var/tmp/backup/" + testCvNameNew + ".zip";
             pathForCvBackupOnFtpServer.insert_string(backupPath);
             org.omg.CORBA.Any getFtpServerIpAddress = orb.create_any();
             getFtpServerIpAddress.insert_string(ftpServer);
             org.omg.CORBA.Any getFtpServerUserId = orb.create_any();
             getFtpServerUserId.insert_string(ftpUser);
             org.omg.CORBA.Any getFtpServerPassword = orb.create_any();
             getFtpServerPassword.insert_string(ftpPass);

             BasicConfig.NameValue[] getFromFtpParam = {new BasicConfig.NameValue("pathForCvBackupOnFtpServer",pathForCvBackupOnFtpServer), new BasicConfig.NameValue("ftpServerIpAddress",getFtpServerIpAddress), new BasicConfig.NameValue("ftpServerUserId",getFtpServerUserId),new BasicConfig.NameValue("ftpServerPassword",getFtpServerPassword)};
             BasicConfig.NameValueSeqHolder getFromFtpParameters = new BasicConfig.NameValueSeqHolder(getFromFtpParam);
             System.out.println("Triggering getFromFtpServer action\n");
             consImpl.setBackupActivityStatus("activitystart");
             consImpl.setBackupActionStatus("actionstart");
             conf.action(cvmo1,"getFromFtpServer",getFromFtpParameters,sess8);
             endTimeMillis = System.currentTimeMillis() + getFromFtpTimeout;
             while (!(consImpl.getBackupActivityStatus().equals("activitycompleted") && consImpl.getBackupActionStatus().equals("actioncompleted"))) {

                if (System.currentTimeMillis() < endTimeMillis) {
                    TimeUnit.SECONDS.sleep(1);
                }
                else {
                    System.out.println("Timedout in get from FTP action");
                    System.exit(1);
                }
             }
             sess8.commit();
             sess8.end();
             Calendar cal8 = Calendar.getInstance();
             System.out.println("Backup state: GET FROM FTP COMPLETED " + sdf.format(cal8.getTime()));
             //Action: Verify Restore CV
             BasicConfig.BasicConfiguration sessObj9 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
             BasicConfig.Session sess9 = sessObj9.create_session("brm9",280);

             String sessionId9 = sess9.get_session_id();
             System.out.println("Session id --" + sessionId9);

             BasicConfig.MOidpair vrcvmo = new MOidpair();
             vrcvmo.name(new CosNaming.NameComponent[] {a1,a2,a3});

             org.omg.CORBA.Any vrCvName = orb.create_any();
             vrCvName.insert_string(testCvNameNew);

             BasicConfig.NameValue[] vrCvParam = {new BasicConfig.NameValue("cvName",delCvName)};
             BasicConfig.NameValueSeqHolder vrCvParameters = new BasicConfig.NameValueSeqHolder(vrCvParam);
             System.out.println("Triggering verify Restore action\n");
             consImpl.setBackupActivityStatus("activitystart");
             consImpl.setBackupActionStatus("actionstart");
             conf.action(delcvmo,"verifyRestore",vrCvParameters,sess9);
             endTimeMillis = System.currentTimeMillis() + verifyRestoreTimeout;
             while (!(consImpl.getBackupActivityStatus().equals("activitycompleted") && consImpl.getBackupActionStatus().equals("actioncompleted"))) {
                 if (System.currentTimeMillis() < endTimeMillis) {
                     TimeUnit.SECONDS.sleep(1);
                 }
                 else {
                    System.out.println("Timedout in verify restore action");
                    System.exit(1);
                 }
             }
             sess9.commit();
             sess9.end();
             Calendar cal9 = Calendar.getInstance();
             System.out.println("Backup state: VERIFY RESOTRE COMPLETED " + sdf.format(cal9.getTime()));
             //Action: Restore CV
             BasicConfig.BasicConfiguration sessObj10 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
             BasicConfig.Session sess10 = sessObj10.create_session("brm10",280);

             String sessionId10 = sess10.get_session_id();
             System.out.println("Session id --" + sessionId10);

             BasicConfig.MOidpair rcvmo = new MOidpair();
             rcvmo.name(new CosNaming.NameComponent[] {a1,a2,a3});

             org.omg.CORBA.Any rCvName = orb.create_any();
             rCvName.insert_string(testCvNameNew);

             BasicConfig.NameValue[] rCvParam = {new BasicConfig.NameValue("cvName",rCvName)};
             BasicConfig.NameValueSeqHolder rCvParameters = new BasicConfig.NameValueSeqHolder(rCvParam);
             System.out.println("Triggering Restore action\n");
             consImpl.setBackupActivityStatus("activitystart");
             consImpl.setBackupActionStatus("actionstart");
             conf.action(rcvmo,"restore",rCvParameters,sess10);
             endTimeMillis = System.currentTimeMillis() + restoreTimeout;
             while (!(consImpl.getBackupActivityStatus().equals("awaitingconfirm") && consImpl.getBackupActionStatus().equals("actioncompleted"))) {
                 if (System.currentTimeMillis() < endTimeMillis) {
                 }
                 else {
                    System.out.println("Timedout in restore action");
                    System.exit(1);
                 }
             }
             sess10.commit();
             sess10.end();
             Calendar cal10 = Calendar.getInstance();
             System.out.println("Backup state: RESTORE COMPLETED " + sdf.format(cal10.getTime()));
             //Action: Confirm restore CV
             BasicConfig.BasicConfiguration sessObj11 = BasicConfig.BasicConfigurationHelper.narrow(ccs);
             BasicConfig.Session sess11 = sessObj11.create_session("brm11",280);

             String sessionId11 = sess11.get_session_id();
             System.out.println("Session id --" + sessionId11);

             BasicConfig.MOidpair crcvmo = new MOidpair();
             crcvmo.name(new CosNaming.NameComponent[] {a1,a2,a3});


             org.omg.CORBA.Any crCvName = orb.create_any();
             crCvName.insert_string(testCvNameNew);

             BasicConfig.NameValue[] crCvParam = {new BasicConfig.NameValue("cvName",crCvName)};
             BasicConfig.NameValueSeqHolder crCvParameters = new BasicConfig.NameValueSeqHolder(crCvParam);
             System.out.println("Triggering Confirm Restore action\n");
             consImpl.setBackupActivityStatus("activitystart");
             consImpl.setBackupActionStatus("actionstart");
             conf.action(rcvmo,"confirmRestore",rCvParameters,sess11);
             endTimeMillis = System.currentTimeMillis() + confirmRestoreTimeout;
             while (!(consImpl.getBackupActivityStatus().equals("activitycompleted") && consImpl.getBackupActionStatus().equals("actioncompleted"))) {
                 if (System.currentTimeMillis() < endTimeMillis) {
                     TimeUnit.SECONDS.sleep(1);
                 }
                 else {
                    System.out.println("Timedout in confirm restore action");
                    System.exit(1);
                 }
             }
             sess11.commit();
             sess11.end();
             Calendar cal11 = Calendar.getInstance();
             System.out.println("Backup state: CONFIRM RESTORE COMPLETED " + sdf.format(cal11.getTime()));
        }
        catch (Exception e) {
            e.printStackTrace(System.out);
            System.exit(1);
        }
    }
}
