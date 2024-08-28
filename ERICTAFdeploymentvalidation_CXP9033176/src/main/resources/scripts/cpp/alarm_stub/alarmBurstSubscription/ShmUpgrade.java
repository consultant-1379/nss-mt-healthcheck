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

// import the generated code (from the previous step). This file should be in the same
// directory as the IDLs, otherwise won't found these packages.
import BasicConfig.*;
import Config.*;

public class ShmUpgrade {
    static ConfigExtended.NotificationConsumer cons;
    public static void main(String[] args) {
        try {

            String nodeName = args[7];
            String simName = args[5];
            String nodeIp = args[3];
            String nodePort = args[1];
            long endTimeMillis;
            long installTimeout = 3600000;
            long verifyTimeout = 600000;
            long upgradeTimeout = 1800000;
            long confirmTimeout = 600000;

            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

            // create the Orber
            ORB orb = ORB.init(args, new Properties());

            // resolve the NameService. Its parameters will be passed on the command line
            org.omg.CORBA.Object obj = orb.resolve_initial_references("NameService");
            NamingContextExt ncRef = NamingContextExtHelper.narrow(obj);
            System.out.println("Objnode:" + obj + "ncRef:" + ncRef);
            org.omg.CORBA.Object ccs = ncRef.resolve_str(simName + "_netsimdir_netsim/" + nodeName + "/CelloConfigurationService");
//            org.omg.CORBA.Object ccs = ncRef.resolve_str("default_netsimdir_xgoumal_home/ERBS01/CelloConfigurationService");
//            org.omg.CORBA.Object ccs = ncRef.resolve_str("LTEJ1160-limx80-60K-FDD-LTE03_netsimdir_netsim/LTE03ERBS00003/CelloConfigurationService");
            ConfigExtended.ConfigurationExtended conf = ConfigExtended.ConfigurationExtendedHelper.narrow(ccs);

//            org.omg.CORBA.Object ncs = ncRef.resolve_str("default_netsimdir_xgoumal_home/ERBS01/NotificationService");
//            ConfigExtended.NotificationConsumer notconf = ConfigExtended.NotificationConsumerHelper.narrow(ncs);
//            System.out.println("ncs: '"+ncs+"'");

            BasicConfig.BasicConfiguration sessObj = BasicConfig.BasicConfigurationHelper.narrow(ccs);
            BasicConfig.Session sess = sessObj.create_session("shm",600);

//Subscribe

            // get reference to rootpoa & activate the POAManager
            POA rootpoa = POAHelper.narrow(orb.resolve_initial_references("RootPOA"));
            rootpoa.the_POAManager().activate();

            // create servant and register it with the ORB
            NotificationConsumerImpl consImpl = new NotificationConsumerImpl(nodeIp,nodePort);
            consImpl.setORB(orb); 
            System.out.println("NotificationConsumer :" + consImpl);

            // get object reference from the servant
            org.omg.CORBA.Object ref = rootpoa.servant_to_reference(consImpl);
            ConfigExtended.NotificationConsumer cons = ConfigExtended.NotificationConsumerHelper.narrow(ref);

//          cons = ConfigExtended.NotificationConsumerHelper.narrow(orb.string_to_object("corbaname:iiop:1.2@127.1.0.3:50073#NotificationService"));

//          cons = ConfigExtended.NotificationConsumerHelper.narrow(orb.string_to_object("corbaname:iiop:1.2@10.155.109.127:56834#Hello"));
          System.out.println("cons:::::::" + cons);

          String[] type1 = {};
          ConfigExtended.NotificationProducerPackage.NotificationFilter nfilter = new ConfigExtended.NotificationProducerPackage.NotificationFilter(type1,true,true,"",-1);
          int timetick1 = 3600;
          org.omg.CORBA.IntHolder id = new IntHolder(0);
          ConfigExtended.NotificationProducer np = conf.get_notification_producer();
          np.subscribe(cons,nfilter,timetick1,id);

//Create upgrade package MO
          CosNaming.NameComponent n1 = new CosNaming.NameComponent("ManagedElement=1","");
          CosNaming.NameComponent n2 = new CosNaming.NameComponent("SwManagement=1","");
          BasicConfig.MOidpair basemo = new MOidpair();
          basemo.name(new CosNaming.NameComponent[] {n1,n2});
          BasicConfig.MOidpair sourcemo = new MOidpair();
          BasicConfig.BasicConfiguration cid = null; 
          BasicConfig.MORef r = new MORef(0,cid,"");
          sourcemo.ref(r);
          org.omg.CORBA.Any ip = orb.create_any();
          ip.insert_string("10.141.11.223");
          org.omg.CORBA.Any path = orb.create_any();
          path.insert_string("/var/tmp/CXPL17BCP1_G1284.xml");
          org.omg.CORBA.Any user = orb.create_any();
          user.insert_string("netsim");
          org.omg.CORBA.Any pass = orb.create_any();
          pass.insert_string("netsim");
       
          
//          org.omg.CORBA.Any ip = orb.create_any();
//          ip.insert_string("127.1.0.3");
//          org.omg.CORBA.Any path = orb.create_any();
//          path.insert_string("/proj/netsimproj/cello/up/UP-NETSIM-TEST/9%99999-CSX99999%9-99_A.xml");

//          BasicConfig.NameValue[] attributes = {new BasicConfig.NameValue("ftpServerIpAddress", ip),new BasicConfig.NameValue("upFilePathOnFtpServer", path)};
          BasicConfig.NameValue[] attributes = {new BasicConfig.NameValue("ftpServerIpAddress", ip),new BasicConfig.NameValue("user",user),new BasicConfig.NameValue("password",pass),new BasicConfig.NameValue("upFilePathOnFtpServer", path)};
          BasicConfig.MOAssociation[] associations = {};
          BasicConfig.MORef m1 = sessObj.basic_create_MO("CXPL17BCP1_G1284","UpgradePackage", basemo, sourcemo, attributes, associations, sess); 
          sess.commit();
          sess.restart();

//Install action
          CosNaming.NameComponent a1 = new CosNaming.NameComponent("ManagedElement=1","");
          CosNaming.NameComponent a2 = new CosNaming.NameComponent("SwManagement=1","");
          CosNaming.NameComponent a3 = new CosNaming.NameComponent("UpgradePackage=CXPL17BCP1_G1284","");
          BasicConfig.MOidpair upmo = new MOidpair();
          upmo.name(new CosNaming.NameComponent[] {a1,a2,a3});
          BasicConfig.NameValue[] nvpar = {};
          BasicConfig.NameValueSeqHolder parameters = new BasicConfig.NameValueSeqHolder(nvpar);
          System.out.println("Triggering install action\n");
          conf.action(upmo,"install",parameters,sess);
          endTimeMillis = System.currentTimeMillis() + installTimeout;
          while (!consImpl.getStatus().equals("installcompleted") ) {
              if (System.currentTimeMillis() < endTimeMillis) {
                  TimeUnit.SECONDS.sleep(10);
              }
              else {
                  System.out.println("Timedout in install action");
                  System.exit(1);
              }
          }
         Calendar cal1 = Calendar.getInstance();
         System.out.println("Upgrade state: INSTALL COMPLETED " + sdf.format(cal1.getTime())); 

//Verify upgrade
          System.out.println("Triggering verify upgrade action\n");
          conf.action(upmo,"verifyupgrade",parameters,sess);
          endTimeMillis = System.currentTimeMillis() + verifyTimeout;
          while (!consImpl.getStatus().equals("verificationfinished") ) {
              if (System.currentTimeMillis() < endTimeMillis) {
                  TimeUnit.SECONDS.sleep(10);
              }
              else {
                  System.out.println("Timedout in verify upgrade action");
                  System.exit(1);
              }
          }
          Calendar cal2 = Calendar.getInstance();
          System.out.println("Upgrade state: VERIFICATION FINISHED " + sdf.format(cal2.getTime())); 

//Upgrade action
          System.out.println("Triggering upgrade action\n");
          conf.action(upmo,"upgrade",parameters,sess);
          endTimeMillis = System.currentTimeMillis() + upgradeTimeout;
          while (!consImpl.getStatus().equals("awaitingconfirmation") ) {
              if (System.currentTimeMillis() < endTimeMillis) {
                  TimeUnit.SECONDS.sleep(10);
              }
              else {
                  System.out.println("Timedout in awaiting confirmation");
                  System.exit(1);
              }
          }
          Calendar cal3 = Calendar.getInstance();
          System.out.println("Upgrade state: AWAITING CONFIRMATION " + sdf.format(cal3.getTime())); 

//Confirm upgrade
          System.out.println("Triggering confirm upgrade action\n");
          conf.action(upmo,"confirmupgrade",parameters,sess);
          endTimeMillis = System.currentTimeMillis() + confirmTimeout;
          while (!consImpl.getStatus().equals("upgradecompleted")) {
              if (System.currentTimeMillis() < endTimeMillis) {
                  TimeUnit.SECONDS.sleep(10);
              }
              else {
                  System.out.println("Timedout in confirm action");
                  System.exit(1);
              }
          } 
          Calendar cal4 = Calendar.getInstance();
          System.out.println("Upgrade state: UPGRADE_COMPLETED " + sdf.format(cal4.getTime())); 
        } 
        catch (Exception e) {
            e.printStackTrace(System.out);
            System.exit(1);
        }
    }
}
