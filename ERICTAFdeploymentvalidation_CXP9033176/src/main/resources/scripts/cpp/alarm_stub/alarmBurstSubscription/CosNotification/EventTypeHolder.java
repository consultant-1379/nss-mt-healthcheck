package CosNotification;

/**
* CosNotification/EventTypeHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNotification_F.idl
* Wednesday, July 11, 2018 2:25:09 PM GMT+01:00
*/

public final class EventTypeHolder implements org.omg.CORBA.portable.Streamable
{
  public CosNotification.EventType value = null;

  public EventTypeHolder ()
  {
  }

  public EventTypeHolder (CosNotification.EventType initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CosNotification.EventTypeHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CosNotification.EventTypeHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CosNotification.EventTypeHelper.type ();
  }

}
