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

public class FileChecker {

    private static final String classListFile="pm_subscribe_observation_class_list";

    public static void main(String[] args) {

		System.out.println(args[0]);
 		// TODO : update code to recursively create list of object of classes 
	    List<String> classStringList = new ArrayList<String>();
		String fullString="";
		try {
			File file = new File(args[0]);
			FileReader fileReader = new FileReader(file);
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			StringBuffer stringBuffer = new StringBuffer();
			String line;
  			int count=0;
			int classCount=1;
			while ((line = bufferedReader.readLine()) != null) {
								
				stringBuffer.append(line);
								
				/*if(line.indexOf('[')!=-1) count++;
				if(line.indexOf(']')!=-1) count--;
				if(count==3){
					String classString = stringBuffer.toString();
					//System.out.println("Line "+classCount+" : "+classString);
					classStringList.add(classString);
					System.out.println(classString);
					stringBuffer.delete(0,stringBuffer.length());
					classCount++;
				}*/
			}
			fullString = stringBuffer.toString();
			fileReader.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		generateObservationClassListForPrmn(fullString, );
	}

public static List<ObservationClass> generateObservationClassListForPrmn(String classListFile){
	String context="";
		try {
			File file = new File(classListFile);
			FileReader fileReader = new FileReader(file);
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			StringBuffer stringBuffer = new StringBuffer();
			String line;
  			int count=0;
			int classCount=1;
			while ((line = bufferedReader.readLine()) != null) {
								
				stringBuffer.append(line);
								
				/*if(line.indexOf('[')!=-1) count++;
				if(line.indexOf(']')!=-1) count--;
				if(count==3){
					String classString = stringBuffer.toString();
					//System.out.println("Line "+classCount+" : "+classString);
					classStringList.add(classString);
					System.out.println(classString);
					stringBuffer.delete(0,stringBuffer.length());
					classCount++;
				}*/
			}
			context = stringBuffer.toString();
			fileReader.close();
			
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	String key="object_class_name,\"";
    List<ObservationClass> observationClassList = new ArrayList<ObservationClass>();

    int index = context.indexOf(key);
    int start,end;
    String className, classAttribList;
    while (index >=0){
	// Find Class Name        
	start=index+key.length();
	end=context.indexOf("\"", start+1);
	className=context.substring(start,end);
	System.out.println("ClassName : "+className);
	
	// Find Class Attribute list indexes
	start=context.indexOf("[", end+1);
	end= context.indexOf("]",start+1);

	// Get list of attributes
	String[] classStringParts = context.substring(start,end).split("\"");
	List<String> strings = new ArrayList<String>();
	for(int i=1; i < classStringParts.length; i=i+2) {
			System.out.println(classStringParts[i]);
			strings.add(classStringParts[i].trim());
		}
	String[] classes = strings.toArray(new String[strings.size()]);

	// Create ObservationClass List
	observationClassList.add(new ObservationClass(className,classes));
        index = context.indexOf(key, end);
    }
 	return observationClassList;
}



private static List<ObservationClass> generateObservationClassList(List<String> classStringList){
	List<ObservationClass> observationClassList = new ArrayList<ObservationClass>();
//	Map<String,ObservationClass> mapObservationClass = new Map<String, ObservationClass>();
	for(String classString : classStringList){
		String[] classStringParts=classString.split("\"");
		String className=classStringParts[1].trim();
		System.out.println("\nClass  : "+className+"\n");
		List<String> strings = new ArrayList<String>();
		for(int i=3; i < classStringParts.length; i=i+2) {
			System.out.println(classStringParts[i]);
			strings.add(classStringParts[i].trim());
		}
		String[] classes = strings.toArray(new String[strings.size()]);
		observationClassList.add(new ObservationClass(className,classes));
	}
	return observationClassList;
}


}

