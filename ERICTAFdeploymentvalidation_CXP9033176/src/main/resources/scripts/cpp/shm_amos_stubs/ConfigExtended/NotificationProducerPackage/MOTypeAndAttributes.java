package ConfigExtended.NotificationProducerPackage;


/**
* ConfigExtended/NotificationProducerPackage/MOTypeAndAttributes.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class MOTypeAndAttributes implements org.omg.CORBA.portable.IDLEntity
{
  public String typeOfMO = null;
  public String attributes[] = null;

  public MOTypeAndAttributes ()
  {
  } // ctor

  public MOTypeAndAttributes (String _typeOfMO, String[] _attributes)
  {
    typeOfMO = _typeOfMO;
    attributes = _attributes;
  } // ctor

} // class MOTypeAndAttributes
