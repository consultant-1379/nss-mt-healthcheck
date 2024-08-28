// just import standard stuff to write shorter names later
import java.util.*;
import org.omg.CORBA.*;
import org.omg.CosNaming.*;
import org.omg.PortableServer.*;
import org.omg.PortableServer.POA;

// import the generated code (from the previous step). This file should be in the same
// directory as the IDLs, otherwise won't found these packages.
import BasicConfig.*;
import Config.*;

class NotificationConsumerImpl extends ConfigExtended.NotificationConsumerPOA {
  private ORB orb;
  private String acip;
  private String acport;
  String status="";
  String backupActivityStatus="";
  String backupActionStatus="";

//  private String upgradeStatus = "null";

  public NotificationConsumerImpl(String ip, String port) {
        acip = ip;
        acport = port;
  }

  public void setORB(ORB orb_val) {
        orb = orb_val;
  }

  public void setIPPort(String ip, String port) {
        acip = ip;
        acport = acport;
  }

  public void setStatus(String status) {
        this.status = status;
  }

  public String getStatus() {
        return this.status;
  }

  public void setBackupActivityStatus(String status) {
        this.backupActivityStatus = status;
  }

  public String getBackupActivityStatus() {
        return this.backupActivityStatus;
  }

  public void setBackupActionStatus(String status) {
        this.backupActionStatus = status;
  }

  public String getBackupActionStatus() {
        return this.backupActionStatus;
  }

  public void push (ConfigExtended.ConfigNotification[] notifications)
  {
        System.out.println("IP:" + this.acip + " PORT:" + this.acport);
        for(ConfigExtended.ConfigNotification obj : notifications){
            if( obj == null )
                System.out.println("Null object");
            else{
                    String result = obj.toString();
                    if ( result.contains("{progressHeader,21}") ) {
                        this.setStatus("verificationfinished");
                    }
                    else if ( result.contains("{state,1}") ) {
                        this.setStatus("installcompleted");
                    }
                    else if ( result.contains("{state,3}") ) {
                        this.setStatus("awaitingconfirmation");
                    }
                    else if ( result.contains("{state,7}") ) {
                        this.setStatus("upgradecompleted");
                    }
                    else if ( result.contains("{currentMainActivity,0}") ) {
                        this.setBackupActivityStatus("activitycompleted");
                    }
                    else if ( result.contains("lastHwPiChange") ) {
                        this.setBackupActionStatus("actioncompleted");
                    }
                    else if ( result.contains("actionResult") ) {
                        this.setBackupActionStatus("actioncompleted");
                    }
                    else if ( result.contains("{currentDetailedActivity,17}") ) {
                        this.setBackupActivityStatus("awaitingconfirm");
                    }
                    else if ( result.contains("storedConfigurationVersions") ) {
                        this.setBackupActivityStatus("deletecompleted");
                    }
//                    System.out.println("<notif>");
                      System.out.println(result + "\n");
//                    System.out.println("</notif>\n");
            }
        }
  } // push

  // implement shutdown() method
  public void shutdown() {
        orb.shutdown(false);
  }
}
