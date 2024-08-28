// just import standard stuff to write shorter names later
// java ERBSSubscriber -OBJInitialPort 56834 -OBJInitialHost <ne-ip> -sim <sim-name> -ne <ne-name>
import java.util.*;
import org.omg.CORBA.*;
import org.omg.CosNaming.*;
import java.io.*;

// import the generated code (from the previous step). This file should be in the same
// directory as the IDLs, otherwise won't found these packages.
import PmServiceExtended.*;
import PerformanceIRPConstDefs.*;
import TimeBase.*;
import CommonIRPConstDefs.*;
//import Config.*;

public class ERBSSynchronizer {
    public static void main(String[] args) {
        try {
            // create the Orber
            ORB orb = ORB.init(args, new Properties());
            // resolve the NameService. Its parameters will be passed on the command line
            org.omg.CORBA.Object obj = orb.resolve_initial_references("NameService");
	    NamingContextExt ncRef = NamingContextExtHelper.narrow(obj);
	    org.omg.CORBA.Object ccs = ncRef.resolve_str(args[5] + "_netsimdir_zpalsri_home/" + args[7] + "/CelloConfigurationService");

	    // TODO : narrow method not working so updated to use unchecked narrow 
       	    // Don't know it's significance. If fails check why narrow is not working

            PerformanceMonitoringExtended pmExtendedObj = PerformanceMonitoringExtendedHelper.unchecked_narrow(ccs);

		// TODO : update code to recursively create list of object of classes 
		// 1st param
	    ObservationClass[] classList = new ObservationClass[1];
	    classList[0]= new ObservationClass("PerformanceIRPConstDefs_ObservationClass",new String[]{"pmNoOfAALINServiceInd","pmNoOfAALOUTInd","pmNoOfCBDSent","pmNoOfCOOXCOSent","pmNoOfLocalLinkCongestCeaseRec","pmNoOfLocalLinkCongestRec","pmNoOfMSURec","pmNoOfMSUSent","pmNoOfRecUserData","pmNoOfSentUserData"});
            
		// 2nd param
		PerformanceIRPConstDefs.ObservationObject[] observationList = new ObservationObject[0];
	
		// 3rd param
		int granularity_period=60;

		// 4th param
		Schedule schedule = new Schedule(new UtcT(),new UtcT(),new int[0]);

		//5th param
		 int reporting_period=60;
		//6th param
		Destination destination = Destination.from_int(Destination._FILE);
		//7th param
		String measurement_name="USERDEF-Statistical_FileCollection_MGW.Cont.Y.STATS";
	    	//8th param
		PerformanceMonitoringState pmState = PerformanceMonitoringState.from_int(PerformanceMonitoringState._SUSPENDED);
		//9th param
		 org.omg.CORBA.IntHolder intHolder = new  org.omg.CORBA.IntHolder(100);
		//10th param
		FailureInformationHolder fiHolder = new FailureInformationHolder();


		// Make request - Wooohooo
		Signal signal = pmExtendedObj.create_performance_monitoring(classList,
				observationList,
				granularity_period,
				schedule,
				reporting_period,
				destination,
				measurement_name,
				pmState,
				intHolder,
				fiHolder);
		
	    /* Session Creation
	       ================
	       BasicConfig.BasicConfiguration sessObj = BasicConfig.BasicConfigurationHelper.narrow(ccs);
	       BasicConfig.Session sess = sessObj.create_session(args[5] + "/" + args[7],600);
	       sess.commit();*/
	    
	    /*MO Action (manualRestart action for ManagedElement MO)
	      ======================================================
	      CosNaming.NameComponent n1 = new CosNaming.NameComponent("ManagedElement=1","");
	      BasicConfig.MOidpair ref1 = new MOidpair();
	      ref1.name(new CosNaming.NameComponent[] {n1});
	      org.omg.CORBA.Any val = orb.create_any();
	      val.insert_long(0);
	      org.omg.CORBA.Any val1 = orb.create_any();
	      val1.insert_string("Strange");
	      BasicConfig.NameValue[] nv = {new BasicConfig.NameValue("restartRank", val),new BasicConfig.NameValue("restartInfo", val1)};
	      BasicConfig.NameValueSeqHolder nvs = new BasicConfig.NameValueSeqHolder (nv);
	      conf.action(ref1, "manualRestart", nvs, sess);*/
	    }
          catch (Exception e) {
            e.printStackTrace(System.out);
        }
    } 
 
    
}
