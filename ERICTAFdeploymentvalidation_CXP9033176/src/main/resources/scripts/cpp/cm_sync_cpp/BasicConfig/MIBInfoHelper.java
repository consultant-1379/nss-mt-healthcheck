package BasicConfig;


/**
* BasicConfig/MIBInfoHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

abstract public class MIBInfoHelper
{
  private static String  _id = "IDL:BasicConfig/MIBInfo/MIBInfo:1.0";

  public static void insert (org.omg.CORBA.Any a, BasicConfig.MIBInfo that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static BasicConfig.MIBInfo extract (org.omg.CORBA.Any a)
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
          org.omg.CORBA.StructMember[] _members0 = new org.omg.CORBA.StructMember [6];
          org.omg.CORBA.TypeCode _tcOf_members0 = null;
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_ulong);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.MIBIDHelper.id (), "MIBID", _tcOf_members0);
          _members0[0] = new org.omg.CORBA.StructMember (
            "id",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.MIBNameHelper.id (), "MIBName", _tcOf_members0);
          _members0[1] = new org.omg.CORBA.StructMember (
            "name",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.MIMNameHelper.id (), "MIMName", _tcOf_members0);
          _members0[2] = new org.omg.CORBA.StructMember (
            "type",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_ulonglong);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (TimeBase.TimeTHelper.id (), "TimeT", _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.TimeTHelper.id (), "TimeT", _tcOf_members0);
          _members0[3] = new org.omg.CORBA.StructMember (
            "created",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.MIMVersionHelper.id (), "MIMVersion", _tcOf_members0);
          _members0[4] = new org.omg.CORBA.StructMember (
            "version",
            _tcOf_members0,
            null);
          _tcOf_members0 = CosNaming.NameComponentHelper.type ();
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_sequence_tc (0, _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (CosNaming.NameHelper.id (), "Name", _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.DNameHelper.id (), "DName", _tcOf_members0);
          _members0[5] = new org.omg.CORBA.StructMember (
            "prefix",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_struct_tc (BasicConfig.MIBInfoHelper.id (), "MIBInfo", _members0);
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

  public static BasicConfig.MIBInfo read (org.omg.CORBA.portable.InputStream istream)
  {
    BasicConfig.MIBInfo value = new BasicConfig.MIBInfo ();
    value.id = istream.read_ulong ();
    value.name = istream.read_string ();
    value.type = istream.read_string ();
    value.created = istream.read_ulonglong ();
    value.version = istream.read_string ();
    value.prefix = CosNaming.NameHelper.read (istream);
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, BasicConfig.MIBInfo value)
  {
    ostream.write_ulong (value.id);
    ostream.write_string (value.name);
    ostream.write_string (value.type);
    ostream.write_ulonglong (value.created);
    ostream.write_string (value.version);
    CosNaming.NameHelper.write (ostream, value.prefix);
  }

}
