package BasicConfig;


/**
* BasicConfig/MOAttrValue.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class MOAttrValue implements org.omg.CORBA.portable.IDLEntity
{
  public BasicConfig.MORef mo = null;
  public org.omg.CORBA.Any attrValues[] = null;

  public MOAttrValue ()
  {
  } // ctor

  public MOAttrValue (BasicConfig.MORef _mo, org.omg.CORBA.Any[] _attrValues)
  {
    mo = _mo;
    attrValues = _attrValues;
  } // ctor

} // class MOAttrValue
