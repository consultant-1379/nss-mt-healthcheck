package Config;


/**
* Config/ConfigRefHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

abstract public class ConfigRefHelper
{
  private static String  _id = "IDL:Config/ConfigRef/ConfigRef:1.0";

  public static void insert (org.omg.CORBA.Any a, Config.ConfigRef that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static Config.ConfigRef extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  private static boolean __active = false;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      synchronized (org.omg.CORBA.TypeCode.class)
      {
        if (__typeCode == null)
        {
          if (__active)
          {
            return org.omg.CORBA.ORB.init().create_recursive_tc ( _id );
          }
          __active = true;
          org.omg.CORBA.StructMember[] _members0 = new org.omg.CORBA.StructMember [1];
          org.omg.CORBA.TypeCode _tcOf_members0 = null;
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_ulonglong);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.OIDTYPEHelper.id (), "OIDTYPE", _tcOf_members0);
          _members0[0] = new org.omg.CORBA.StructMember (
            "oid",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_struct_tc (Config.ConfigRefHelper.id (), "ConfigRef", _members0);
          __active = false;
        }
      }
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static Config.ConfigRef read (org.omg.CORBA.portable.InputStream istream)
  {
    Config.ConfigRef value = new Config.ConfigRef ();
    value.oid = istream.read_ulonglong ();
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, Config.ConfigRef value)
  {
    ostream.write_ulonglong (value.oid);
  }

}
