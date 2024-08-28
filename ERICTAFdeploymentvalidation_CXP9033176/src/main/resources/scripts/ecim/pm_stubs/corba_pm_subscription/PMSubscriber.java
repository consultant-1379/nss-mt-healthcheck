// just import standard stuff to write shorter names later
// java ERBSSubscriber -OBJInitialPort 56834 -OBJInitialHost <ne-ip> -sim <sim-name> -ne <ne-name>
import java.util.*;
import org.omg.CORBA.*;
import org.omg.CosNaming.*;
import java.io.*;
import java.util.ArrayList;

// import the generated code (from the previous step). This file should be in the same
// directory as the IDLs, otherwise won't found these packages.
import PmServiceExtended.*;
import PerformanceIRPConstDefs.*;
import TimeBase.*;
import CommonIRPConstDefs.*;
//import Config.*;

public class PMSubscriber {



    public static void main(String[] args) {
        try {
            // create the Orber
            ORB orb = ORB.init(args, new Properties());
	   // String names[] = orb.list_initial_references();
	   // System.out.println(names);
            // resolve the NameService. Its parameters will be passed on the command line
            org.omg.CORBA.Object obj = orb.resolve_initial_references("NameService");
	    NamingContextExt ncRef = NamingContextExtHelper.narrow(obj);
	  
	  // Below commented code did not worked if the simulation name contained "."
          // As NameComponent has 2 parts - id , kind . They can be seperated by "." if we passing as string. Which caused the issue cannotproceed expection
          //org.omg.CORBA.Object pms = ncRef.resolve_str(args[5]+"_netsimdir_netsim/"+args[7]+"/CelloPerformanceMonitoring");

		String ne=args[7];
		String sim=args[5];
	   NameComponent comp1 = new NameComponent(sim+"_netsimdir_netsim", "");
	   NameComponent comp2 = new NameComponent(ne, "");
	   NameComponent acctName = new NameComponent("CelloPerformanceMonitoring", "");
	   NameComponent acctPath[] = { comp1, comp2, acctName };
	    org.omg.CORBA.Object pms = ncRef.resolve(acctPath);
	  
	
	    // TODO : narrow method not working so updated to use unchecked narrow 
       	    // Don't know it's significance. If fails check why narrow is not working

            PerformanceMonitoringExtended pmExtendedObj = PerformanceMonitoringExtendedHelper.narrow(pms);

	    // TODO : update code to recursively create list of object of classes 


	 // 1st param
	ObservationClass[] classList;
		// Deserialization
        try
        {   
            // Reading the object from a file
	    String filename = "request_object.ser";
            FileInputStream file = new FileInputStream(filename);
            ObjectInputStream in = new ObjectInputStream(file);
             
            // Method for deserialization of object
            classList = (ObservationClass[])in.readObject();
             
            in.close();
            file.close();
             
        }
         
        catch(IOException ex)
        {
            System.out.println("IOException is caught");
		return;
        }
         

		
	 //   classList[0]= new ObservationClass("Mtp3bSlAnsi",new String[]{"pmNoOfAALINServiceInd","pmNoOfAALOUTInd","pmNoOfCBDSent","pmNoOfCOOXCOSent","pmNoOfLocalLinkCongestCeaseRec","pmNoOfLocalLinkCongestRec","pmNoOfMSURec","pmNoOfMSUSent","pmNoOfRecUserData","pmNoOfSentUserData"});
            
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
		 org.omg.CORBA.IntHolder intHolder = new  org.omg.CORBA.IntHolder();
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
		if(signal.value()==0){
			int id = intHolder.value;
			System.out.println("Creation of PM successfull on "+ne+" , ID : "+id);
			signal = pmExtendedObj.resume_performance_monitoring ( new int[] {id},new PerformanceMonitoringIdListHolder(),new PerformanceMonitoringIdListHolder());
			if(signal.value()==0){
				System.out.println("Resuming PM successfull on "+ne+" , ID : "+id);
			}
		}

		
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
