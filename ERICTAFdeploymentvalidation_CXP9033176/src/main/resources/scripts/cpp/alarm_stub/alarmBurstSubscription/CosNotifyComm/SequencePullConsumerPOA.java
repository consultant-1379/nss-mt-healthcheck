package CosNotifyComm;


/**
* CosNotifyComm/SequencePullConsumerPOA.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNotifyComm.idl
* Wednesday, July 11, 2018 2:25:10 PM GMT+01:00
*/


// SequencePushConsumer
public abstract class SequencePullConsumerPOA extends org.omg.PortableServer.Servant
 implements CosNotifyComm.SequencePullConsumerOperations, org.omg.CORBA.portable.InvokeHandler
{

  // Constructors

  private static java.util.Hashtable _methods = new java.util.Hashtable ();
  static
  {
    _methods.put ("disconnect_sequence_pull_consumer", new java.lang.Integer (0));
    _methods.put ("offer_change", new java.lang.Integer (1));
  }

  public org.omg.CORBA.portable.OutputStream _invoke (String $method,
                                org.omg.CORBA.portable.InputStream in,
                                org.omg.CORBA.portable.ResponseHandler $rh)
  {
    org.omg.CORBA.portable.OutputStream out = null;
    java.lang.Integer __method = (java.lang.Integer)_methods.get ($method);
    if (__method == null)
      throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);

    switch (__method.intValue ())
    {
       case 0:  // CosNotifyComm/SequencePullConsumer/disconnect_sequence_pull_consumer
       {
         this.disconnect_sequence_pull_consumer ();
         out = $rh.createReply();
         break;
       }

       case 1:  // CosNotifyComm/NotifyPublish/offer_change
       {
         try {
           CosNotification.EventType added[] = CosNotification.EventTypeSeqHelper.read (in);
           CosNotification.EventType removed[] = CosNotification.EventTypeSeqHelper.read (in);
           this.offer_change (added, removed);
           out = $rh.createReply();
         } catch (CosNotifyComm.InvalidEventType $ex) {
           out = $rh.createExceptionReply ();
           CosNotifyComm.InvalidEventTypeHelper.write (out, $ex);
         }
         break;
       }

       default:
         throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);
    }

    return out;
  } // _invoke

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:omg.org/CosNotifyComm/SequencePullConsumer:1.0", 
    "IDL:omg.org/CosNotifyComm/NotifyPublish:1.0"};

  public String[] _all_interfaces (org.omg.PortableServer.POA poa, byte[] objectId)
  {
    return (String[])__ids.clone ();
  }

  public SequencePullConsumer _this() 
  {
    return SequencePullConsumerHelper.narrow(
    super._this_object());
  }

  public SequencePullConsumer _this(org.omg.CORBA.ORB orb) 
  {
    return SequencePullConsumerHelper.narrow(
    super._this_object(orb));
  }


} // class SequencePullConsumerPOA
