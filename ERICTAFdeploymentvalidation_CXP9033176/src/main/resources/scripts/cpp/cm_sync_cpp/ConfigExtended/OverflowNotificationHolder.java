package ConfigExtended;

/**
* ConfigExtended/OverflowNotificationHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_G.idl
* Friday, June 1, 2018 12:05:52 PM GMT+01:00
*/

public final class OverflowNotificationHolder implements org.omg.CORBA.portable.Streamable
{
  public ConfigExtended.OverflowNotification value = null;

  public OverflowNotificationHolder ()
  {
  }

  public OverflowNotificationHolder (ConfigExtended.OverflowNotification initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = ConfigExtended.OverflowNotificationHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    ConfigExtended.OverflowNotificationHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return ConfigExtended.OverflowNotificationHelper.type ();
  }

}
