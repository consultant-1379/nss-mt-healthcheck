package BasicConfig;


/**
* BasicConfig/MGInfo.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class MGInfo implements org.omg.CORBA.portable.IDLEntity
{
  public int id = (int)0;
  public String name = null;
  public long created = (long)0;

  public MGInfo ()
  {
  } // ctor

  public MGInfo (int _id, String _name, long _created)
  {
    id = _id;
    name = _name;
    created = _created;
  } // ctor

} // class MGInfo
