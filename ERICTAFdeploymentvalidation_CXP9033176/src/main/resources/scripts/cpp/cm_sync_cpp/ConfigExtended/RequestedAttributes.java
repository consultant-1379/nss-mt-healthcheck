package ConfigExtended;


/**
* ConfigExtended/RequestedAttributes.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_G.idl
* Friday, June 1, 2018 12:05:52 PM GMT+01:00
*/

public final class RequestedAttributes implements org.omg.CORBA.portable.IDLEntity
{
  public String moName = null;
  public String attributes[] = null;

  public RequestedAttributes ()
  {
  } // ctor

  public RequestedAttributes (String _moName, String[] _attributes)
  {
    moName = _moName;
    attributes = _attributes;
  } // ctor

} // class RequestedAttributes
