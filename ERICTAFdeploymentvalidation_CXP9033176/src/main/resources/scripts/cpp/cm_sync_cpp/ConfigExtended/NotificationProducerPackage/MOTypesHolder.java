package ConfigExtended.NotificationProducerPackage;


/**
* ConfigExtended/NotificationProducerPackage/MOTypesHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_G.idl
* Friday, June 1, 2018 12:05:52 PM GMT+01:00
*/

public final class MOTypesHolder implements org.omg.CORBA.portable.Streamable
{
  public String value[] = null;

  public MOTypesHolder ()
  {
  }

  public MOTypesHolder (String[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = ConfigExtended.NotificationProducerPackage.MOTypesHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    ConfigExtended.NotificationProducerPackage.MOTypesHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return ConfigExtended.NotificationProducerPackage.MOTypesHelper.type ();
  }

}
