package BasicConfig;


/**
* BasicConfig/AttributeInfoHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

abstract public class AttributeInfoHelper
{
  private static String  _id = "IDL:BasicConfig/AttributeInfo/AttributeInfo:1.0";

  public static void insert (org.omg.CORBA.Any a, BasicConfig.AttributeInfo that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static BasicConfig.AttributeInfo extract (org.omg.CORBA.Any a)
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
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_string_tc (0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.AttributeNameHelper.id (), "AttributeName", _tcOf_members0);
          _members0[0] = new org.omg.CORBA.StructMember (
            "name",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_any);
          _members0[1] = new org.omg.CORBA.StructMember (
            "oldValue",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_any);
          _members0[2] = new org.omg.CORBA.StructMember (
            "newValue",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_struct_tc (BasicConfig.AttributeInfoHelper.id (), "AttributeInfo", _members0);
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

  public static BasicConfig.AttributeInfo read (org.omg.CORBA.portable.InputStream istream)
  {
    BasicConfig.AttributeInfo value = new BasicConfig.AttributeInfo ();
    value.name = istream.read_string ();
    value.oldValue = istream.read_any ();
    value.newValue = istream.read_any ();
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, BasicConfig.AttributeInfo value)
  {
    ostream.write_string (value.name);
    ostream.write_any (value.oldValue);
    ostream.write_any (value.newValue);
  }

}
