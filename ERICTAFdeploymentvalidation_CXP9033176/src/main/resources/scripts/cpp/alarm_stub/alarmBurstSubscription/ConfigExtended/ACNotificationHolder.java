package ConfigExtended;

/**
* ConfigExtended/ACNotificationHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class ACNotificationHolder implements org.omg.CORBA.portable.Streamable
{
  public ConfigExtended.ACNotification value = null;

  public ACNotificationHolder ()
  {
  }

  public ACNotificationHolder (ConfigExtended.ACNotification initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = ConfigExtended.ACNotificationHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    ConfigExtended.ACNotificationHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return ConfigExtended.ACNotificationHelper.type ();
  }

}
