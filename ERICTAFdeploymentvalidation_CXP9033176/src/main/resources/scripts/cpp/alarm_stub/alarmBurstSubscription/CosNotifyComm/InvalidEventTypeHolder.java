package CosNotifyComm;

/**
* CosNotifyComm/InvalidEventTypeHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNotifyComm.idl
* Wednesday, July 11, 2018 2:25:10 PM GMT+01:00
*/

public final class InvalidEventTypeHolder implements org.omg.CORBA.portable.Streamable
{
  public CosNotifyComm.InvalidEventType value = null;

  public InvalidEventTypeHolder ()
  {
  }

  public InvalidEventTypeHolder (CosNotifyComm.InvalidEventType initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CosNotifyComm.InvalidEventTypeHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CosNotifyComm.InvalidEventTypeHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CosNotifyComm.InvalidEventTypeHelper.type ();
  }

}
