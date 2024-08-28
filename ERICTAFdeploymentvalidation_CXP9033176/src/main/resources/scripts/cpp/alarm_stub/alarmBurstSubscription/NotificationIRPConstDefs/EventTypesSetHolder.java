package NotificationIRPConstDefs;


/**
* NotificationIRPConstDefs/EventTypesSetHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from NotificationIRPConstDefs_F.idl
* Wednesday, July 11, 2018 2:25:15 PM GMT+01:00
*/


/*
  This sequence identifies all event types of all notification categories
  identified by NotificationCategorySet.  The number of elements in this
  sequence shall be identical to that of NotificationCategorySet.
  */
public final class EventTypesSetHolder implements org.omg.CORBA.portable.Streamable
{
  public String value[][] = null;

  public EventTypesSetHolder ()
  {
  }

  public EventTypesSetHolder (String[][] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = NotificationIRPConstDefs.EventTypesSetHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    NotificationIRPConstDefs.EventTypesSetHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return NotificationIRPConstDefs.EventTypesSetHelper.type ();
  }

}
