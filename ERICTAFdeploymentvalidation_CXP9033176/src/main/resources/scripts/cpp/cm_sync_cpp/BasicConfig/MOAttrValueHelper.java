package BasicConfig;


/**
* BasicConfig/MOAttrValueHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

abstract public class MOAttrValueHelper
{
  private static String  _id = "IDL:BasicConfig/MOAttrValue/MOAttrValue:1.0";

  public static void insert (org.omg.CORBA.Any a, BasicConfig.MOAttrValue that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static BasicConfig.MOAttrValue extract (org.omg.CORBA.Any a)
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
          _tcOf_members0 = BasicConfig.MORefHelper.type ();
          _members0[0] = new org.omg.CORBA.StructMember (
            "mo",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_any);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_sequence_tc (0, _tcOf_members0);
          _members0[1] = new org.omg.CORBA.StructMember (
            "attrValues",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_struct_tc (BasicConfig.MOAttrValueHelper.id (), "MOAttrValue", _members0);
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

  public static BasicConfig.MOAttrValue read (org.omg.CORBA.portable.InputStream istream)
  {
    BasicConfig.MOAttrValue value = new BasicConfig.MOAttrValue ();
    value.mo = BasicConfig.MORefHelper.read (istream);
    int _len0 = istream.read_long ();
    value.attrValues = new org.omg.CORBA.Any[_len0];
    for (int _o1 = 0;_o1 < value.attrValues.length; ++_o1)
      value.attrValues[_o1] = istream.read_any ();
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, BasicConfig.MOAttrValue value)
  {
    BasicConfig.MORefHelper.write (ostream, value.mo);
    ostream.write_long (value.attrValues.length);
    for (int _i0 = 0;_i0 < value.attrValues.length; ++_i0)
      ostream.write_any (value.attrValues[_i0]);
  }

}
