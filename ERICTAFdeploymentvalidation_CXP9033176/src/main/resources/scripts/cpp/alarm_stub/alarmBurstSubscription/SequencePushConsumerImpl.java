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

class SequencePushConsumerImpl extends CosNotifyComm.SequencePushConsumerPOA {
  private ORB orb;
  private String acip;
  private String acport;
  String status="";

//  private String upgradeStatus = "null";

  public SequencePushConsumerImpl(String ip, String port) {
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

  public void push_structured_events (CosNotification.StructuredEvent[] notifications)
  {
        System.out.println("IP:" + this.acip + " PORT:" + this.acport);
        for(CosNotification.StructuredEvent obj : notifications){
            if( obj == null )
                System.out.println("Null object");
            else{
                    String result = obj.toString();
                    System.out.println(result + "\n");
            }
        }
  } // push

  public void disconnect_sequence_push_consumer ()
  {
        System.out.println("Sequence push consumer disconnected");
  }

  public void offer_change (CosNotification.EventType[] added, CosNotification.EventType[] removed)
  {
        System.out.println("Notification added/removed");
  }


  // implement shutdown() method
  public void shutdown() {
        orb.shutdown(false);
  }
}
