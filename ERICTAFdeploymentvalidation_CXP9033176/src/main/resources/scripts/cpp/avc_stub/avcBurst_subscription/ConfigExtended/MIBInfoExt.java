package ConfigExtended;


/**
* ConfigExtended/MIBInfoExt.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class MIBInfoExt implements org.omg.CORBA.portable.IDLEntity
{
  public int id = (int)0;
  public String name = null;
  public String type = null;
  public long created = (long)0;
  public String version = null;
  public String release = null;
  public CosNaming.NameComponent prefix[] = null;

  public MIBInfoExt ()
  {
  } // ctor

  public MIBInfoExt (int _id, String _name, String _type, long _created, String _version, String _release, CosNaming.NameComponent[] _prefix)
  {
    id = _id;
    name = _name;
    type = _type;
    created = _created;
    version = _version;
    release = _release;
    prefix = _prefix;
  } // ctor

} // class MIBInfoExt
