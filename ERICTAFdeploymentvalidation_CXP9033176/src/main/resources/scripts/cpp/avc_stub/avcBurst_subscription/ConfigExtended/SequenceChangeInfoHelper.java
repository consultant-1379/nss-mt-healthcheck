package ConfigExtended;


/**
* ConfigExtended/SequenceChangeInfoHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

abstract public class SequenceChangeInfoHelper
{
  private static String  _id = "IDL:ConfigExtended/SequenceChangeInfo/SequenceChangeInfo:1.0";

  public static void insert (org.omg.CORBA.Any a, ConfigExtended.SequenceChangeInfo that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static ConfigExtended.SequenceChangeInfo extract (org.omg.CORBA.Any a)
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
          org.omg.CORBA.StructMember[] _members0 = new org.omg.CORBA.StructMember [2];
          org.omg.CORBA.TypeCode _tcOf_members0 = null;
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_any);
          _members0[0] = new org.omg.CORBA.StructMember (
            "value",
            _tcOf_members0,
            null);
          _tcOf_members0 = ConfigExtended.SequenceElementChangeTypeHelper.type ();
          _members0[1] = new org.omg.CORBA.StructMember (
            "type",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_struct_tc (ConfigExtended.SequenceChangeInfoHelper.id (), "SequenceChangeInfo", _members0);
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

  public static ConfigExtended.SequenceChangeInfo read (org.omg.CORBA.portable.InputStream istream)
  {
    ConfigExtended.SequenceChangeInfo value = new ConfigExtended.SequenceChangeInfo ();
    value.value = istream.read_any ();
    value.type = ConfigExtended.SequenceElementChangeTypeHelper.read (istream);
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, ConfigExtended.SequenceChangeInfo value)
  {
    ostream.write_any (value.value);
    ConfigExtended.SequenceElementChangeTypeHelper.write (ostream, value.type);
  }

}
