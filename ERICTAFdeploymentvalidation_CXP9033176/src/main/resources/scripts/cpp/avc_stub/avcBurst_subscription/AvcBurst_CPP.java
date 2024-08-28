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

public class AlarmBurst{
    static ConfigExtended.NotificationConsumer cons;
    public static void main(String[] args) {
        try {
	    long totalTime = Long.parseLong(args[9]);
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
	System.out.println("Id--" + id.value);
         TimeUnit.SECONDS.sleep(totalTime);
         np.unsubscribe(id.value);

        } 
        catch (Exception e) {
            e.printStackTrace(System.out);
            System.exit(1);
        }
    }
}
