package CosNotifyComm;

/**
* CosNotifyComm/PullConsumerHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNotifyComm.idl
* Wednesday, July 11, 2018 2:25:10 PM GMT+01:00
*/


// PushConsumer
public final class PullConsumerHolder implements org.omg.CORBA.portable.Streamable
{
  public CosNotifyComm.PullConsumer value = null;

  public PullConsumerHolder ()
  {
  }

  public PullConsumerHolder (CosNotifyComm.PullConsumer initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CosNotifyComm.PullConsumerHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CosNotifyComm.PullConsumerHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CosNotifyComm.PullConsumerHelper.type ();
  }

}
