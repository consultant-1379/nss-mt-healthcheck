package BasicConfig;


/**
* BasicConfig/MGInfoHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

abstract public class MGInfoHelper
{
  private static String  _id = "IDL:BasicConfig/MGInfo/MGInfo:1.0";

  public static void insert (org.omg.CORBA.Any a, BasicConfig.MGInfo that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static BasicConfig.MGInfo extract (org.omg.CORBA.Any a)
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
          org.omg.CORBA.StructMember[] _members0 = new org.omg.CORBA.StructMember [3];
          org.omg.CORBA.TypeCode _tcOf_members0 = null;
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_ulong);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.MGIDHelper.id (), "MGID", _tcOf_members0);
          _members0[0] = new org.omg.CORBA.StructMember (
            "id",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.MGNameHelper.id (), "MGName", _tcOf_members0);
          _members0[1] = new org.omg.CORBA.StructMember (
            "name",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_ulonglong);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (TimeBase.TimeTHelper.id (), "TimeT", _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.TimeTHelper.id (), "TimeT", _tcOf_members0);
          _members0[2] = new org.omg.CORBA.StructMember (
            "created",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_struct_tc (BasicConfig.MGInfoHelper.id (), "MGInfo", _members0);
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

  public static BasicConfig.MGInfo read (org.omg.CORBA.portable.InputStream istream)
  {
    BasicConfig.MGInfo value = new BasicConfig.MGInfo ();
    value.id = istream.read_ulong ();
    value.name = istream.read_string ();
    value.created = istream.read_ulonglong ();
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, BasicConfig.MGInfo value)
  {
    ostream.write_ulong (value.id);
    ostream.write_string (value.name);
    ostream.write_ulonglong (value.created);
  }

}
