package ConfigExtended;

/**
* ConfigExtended/NotificationKindHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class NotificationKindHolder implements org.omg.CORBA.portable.Streamable
{
  public ConfigExtended.NotificationKind value = null;

  public NotificationKindHolder ()
  {
  }

  public NotificationKindHolder (ConfigExtended.NotificationKind initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = ConfigExtended.NotificationKindHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    ConfigExtended.NotificationKindHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return ConfigExtended.NotificationKindHelper.type ();
  }

}
