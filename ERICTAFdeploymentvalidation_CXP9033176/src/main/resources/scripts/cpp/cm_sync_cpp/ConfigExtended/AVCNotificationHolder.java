package ConfigExtended;

/**
* ConfigExtended/AVCNotificationHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_G.idl
* Friday, June 1, 2018 12:05:52 PM GMT+01:00
*/

public final class AVCNotificationHolder implements org.omg.CORBA.portable.Streamable
{
  public ConfigExtended.AVCNotification value = null;

  public AVCNotificationHolder ()
  {
  }

  public AVCNotificationHolder (ConfigExtended.AVCNotification initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = ConfigExtended.AVCNotificationHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    ConfigExtended.AVCNotificationHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return ConfigExtended.AVCNotificationHelper.type ();
  }

}
