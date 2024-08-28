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

public class AlarmStub {
    static ConfigExtended.NotificationConsumer cons;
    public static void main(String[] args) {
        try {

            String nodeName = args[7];
            String simName = args[5];
            String nodeIp = args[3];
            String nodePort = args[1];
            long timeOut =  Long.parseLong(args[9]);

            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

            // create the Orber
            ORB orb = ORB.init(args, new Properties());

            // resolve the NameService. Its parameters will be passed on the command line
            org.omg.CORBA.Object obj = orb.resolve_initial_references("NameService");
            NamingContextExt ncRef = NamingContextExtHelper.narrow(obj);
            System.out.println("Objnode:" + obj + "ncRef:" + ncRef);
//            org.omg.CORBA.Object nirp = ncRef.resolve_str(simName + "_netsimdir_xgoumal_home/" + nodeName + "/NOTIFICATION_IRP_VERSION_1_1");
            org.omg.CORBA.Object nirp = ncRef.resolve_str(simName + "_netsimdir_netsim/" + nodeName + "/NOTIFICATION_IRP_VERSION_1_1");
            CelloNotificationIRPExtension.NotificationIRPExtension cnconf = CelloNotificationIRPExtension.NotificationIRPExtensionHelper.narrow(nirp);

//Subscribe

            // get reference to rootpoa & activate the POAManager
            POA rootpoa = POAHelper.narrow(orb.resolve_initial_references("RootPOA"));
            rootpoa.the_POAManager().activate();

            // create servant and register it with the ORB

            SequencePushConsumerImpl seqImpl = new SequencePushConsumerImpl(nodeIp,nodePort);
            seqImpl.setORB(orb);

            // get object reference from the servant
            org.omg.CORBA.Object ref = rootpoa.servant_to_reference(seqImpl);
            CosNotifyComm.SequencePushConsumer seq = CosNotifyComm.SequencePushConsumerHelper.narrow(ref);

            //Subscribe to the node
            String type[] = {"1f1"};
            String filter ="";
            int timetick1 = 10000;
            String attachId = cnconf.attach_push(seq,timetick1,type,filter);
            TimeUnit.SECONDS.sleep(timeOut);
//	    String ids[]=cnconf.get_subscription_ids(seq);
	    System.out.println("Subscription IDS---> " + attachId);
            cnconf.detach(seq,attachId);
        }
        catch (Exception e) {
            e.printStackTrace(System.out);
            System.exit(1);
        }
    }
}
