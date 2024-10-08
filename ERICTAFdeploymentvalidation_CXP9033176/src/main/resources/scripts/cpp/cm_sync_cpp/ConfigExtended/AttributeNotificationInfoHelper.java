package ConfigExtended;


/**
* ConfigExtended/AttributeNotificationInfoHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_G.idl
* Friday, June 1, 2018 12:05:52 PM GMT+01:00
*/

abstract public class AttributeNotificationInfoHelper
{
  private static String  _id = "IDL:ConfigExtended/AttributeNotificationInfo/AttributeNotificationInfo:1.0";

  public static void insert (org.omg.CORBA.Any a, ConfigExtended.AttributeNotificationInfo that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static ConfigExtended.AttributeNotificationInfo extract (org.omg.CORBA.Any a)
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
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.AttributeNameHelper.id (), "AttributeName", _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (ConfigExtended.AttributeNameHelper.id (), "AttributeName", _tcOf_members0);
          _members0[0] = new org.omg.CORBA.StructMember (
            "name",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_any);
          _members0[1] = new org.omg.CORBA.StructMember (
            "newValue",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_struct_tc (ConfigExtended.AttributeNotificationInfoHelper.id (), "AttributeNotificationInfo", _members0);
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

  public static ConfigExtended.AttributeNotificationInfo read (org.omg.CORBA.portable.InputStream istream)
  {
    ConfigExtended.AttributeNotificationInfo value = new ConfigExtended.AttributeNotificationInfo ();
    value.name = istream.read_string ();
    value.newValue = istream.read_any ();
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, ConfigExtended.AttributeNotificationInfo value)
  {
    ostream.write_string (value.name);
    ostream.write_any (value.newValue);
  }

}
