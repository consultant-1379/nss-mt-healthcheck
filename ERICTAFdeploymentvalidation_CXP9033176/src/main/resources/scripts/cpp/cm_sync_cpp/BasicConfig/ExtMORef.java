package BasicConfig;


/**
* BasicConfig/ExtMORef.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class ExtMORef implements org.omg.CORBA.portable.IDLEntity
{
  public long oid = (long)0;
  public BasicConfig.BasicConfiguration cid = null;
  public BasicConfig.NameValue nvs[] = null;

  public ExtMORef ()
  {
  } // ctor

  public ExtMORef (long _oid, BasicConfig.BasicConfiguration _cid, BasicConfig.NameValue[] _nvs)
  {
    oid = _oid;
    cid = _cid;
    nvs = _nvs;
  } // ctor

} // class ExtMORef
