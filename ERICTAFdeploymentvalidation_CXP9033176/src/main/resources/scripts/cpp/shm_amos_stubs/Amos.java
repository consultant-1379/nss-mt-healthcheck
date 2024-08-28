// just import standard stuff to write shorter names later
import java.util.*;
import org.omg.CORBA.*;
import org.omg.CosNaming.*;
import java.util.concurrent.TimeUnit;
import org.omg.PortableServer.*;
import org.omg.PortableServer.POA;

// import the generated code (from the previous step). This file should be in the same
// directory as the IDLs, otherwise won't found these packages.
import BasicConfig.*;
import Config.*;

public class Amos {

    static ConfigExtended.NotificationConsumer cons;

    public static void main(String[] args) {

        try {
            String nodeName = args[7];
            String simName = args[5];
            String nodeIp = args[3];
            String nodePort = args[1];

            // create the Orber
            ORB orb = ORB.init(args, new Properties());

            // resolve the NameService. Its parameters will be passed on the command line
            org.omg.CORBA.Object obj = orb.resolve_initial_references("NameService");
            NamingContextExt ncRef = NamingContextExtHelper.narrow(obj);
            System.out.println("Objnode:" + obj + "ncRef:" + ncRef);
//           org.omg.CORBA.Object ccs = ncRef.resolve_str(simName + "_netsimdir_xgoumal_home/" + nodeName + "/CelloConfigurationService");
            org.omg.CORBA.Object ccs = ncRef.resolve_str(simName + "_netsimdir_netsim/" + nodeName + "/CelloConfigurationService");
            ConfigExtended.ConfigurationExtended conf = ConfigExtended.ConfigurationExtendedHelper.narrow(ccs);

            BasicConfig.BasicConfiguration sessObj = BasicConfig.BasicConfigurationHelper.narrow(ccs);
            BasicConfig.Session sess = sessObj.create_session("amos",600);

            for(int i=0;i<1;i++){
                conf.get_root_MO(sess);
                CosNaming.NameComponent r1 = new CosNaming.NameComponent("ManagedElement=1","");
                BasicConfig.MOidpair rootmo = new MOidpair();
                rootmo.name(new CosNaming.NameComponent[] {r1});
                conf.basic_get_MO_info(rootmo,sess);

                String baseMO = "ManagedElement=1";
                int scope = 20;
                String _type = "";
                String _constraint = "";
                BasicConfig.Filter filter = new Filter(_type,_constraint);
                int iterref;
                iterref = conf.get_MO_containment(baseMO,scope,filter,sess);

                ConfigExtended.MOInfo[] initVal = {};
                ConfigExtended.MOInfoSeqHolder mosq = new ConfigExtended.MOInfoSeqHolder(initVal);
                boolean isAvailableNextMO=true;
                int cnt = 0;
                int maxcnt = 100;
                while ( isAvailableNextMO ) {
                    if ( cnt > maxcnt ) {
                        System.out.print("Max iterations reached exiting");
                        System.exit(1);
                    }
                    cnt = cnt + 1;
                    isAvailableNextMO = conf.next_MO_info(iterref,10000,sess,mosq);
                    System.out.println("IterationCount:" + cnt + " NextMO available:" + isAvailableNextMO);
                }

            }
           // void basic_get_MO_attributes (BasicConfig.MOidpair mo, String[] attributeNames, BasicConfig.NameValueSeqHolder attributes, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
//
//            CosNaming.NameComponent a1 = new CosNaming.NameComponent("ManagedElement=1","");
//            CosNaming.NameComponent a2 = new CosNaming.NameComponent("SwManagement=1","");
//            CosNaming.NameComponent a3 = new CosNaming.NameComponent("UpgradePackage=1","");
//            BasicConfig.MOidpair upmo = new MOidpair();
//            upmo.name(new CosNaming.NameComponent[] {a1,a2,a3});
//            BasicConfig.NameValue[] nvpar = {};
//            BasicConfig.NameValueSeqHolder attributes = new BasicConfig.NameValueSeqHolder(nvpar);
//            String[] attributeNames = {"UpgradePackageId","actionResult","actualTypeOfUP","administrativeData","basedOnUpgradePackages","confirmationDeadline","cppUpVersion","deletePreventingCVs","deletePreventingUPs","ftpServerIpAddress","hsiVariant","isDeletable","loadModuleList","maxTimeBetweenUpgradeEvents","origUcfChecksum","otherReferringCVs","password","preUpgradeState","progressCount","progressHeader","progressHeaderAddInfo","progressTotal","requestedTypeOfUP","sendEvents","state","stepLabel","typeOfUP","ucfChecksum","upCompatibilityIndex","upFilePathOnFtpServer","upgradeControlFilePath","upgradePackageDocumentId","user","userLabel"};
//            conf.basic_get_MO_attributes(upmo,attributeNames,attributes,sess);
//            System.out.println("Attributes" + attributes);
//
        }
        catch (Exception e) {
            e.printStackTrace(System.out);
            System.exit(1);
        }
    }
}

