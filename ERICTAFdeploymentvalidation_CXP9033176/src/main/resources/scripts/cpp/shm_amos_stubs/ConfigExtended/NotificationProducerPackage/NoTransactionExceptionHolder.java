package ConfigExtended.NotificationProducerPackage;

/**
* ConfigExtended/NotificationProducerPackage/NoTransactionExceptionHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class NoTransactionExceptionHolder implements org.omg.CORBA.portable.Streamable
{
  public ConfigExtended.NotificationProducerPackage.NoTransactionException value = null;

  public NoTransactionExceptionHolder ()
  {
  }

  public NoTransactionExceptionHolder (ConfigExtended.NotificationProducerPackage.NoTransactionException initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = ConfigExtended.NotificationProducerPackage.NoTransactionExceptionHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    ConfigExtended.NotificationProducerPackage.NoTransactionExceptionHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return ConfigExtended.NotificationProducerPackage.NoTransactionExceptionHelper.type ();
  }

}
