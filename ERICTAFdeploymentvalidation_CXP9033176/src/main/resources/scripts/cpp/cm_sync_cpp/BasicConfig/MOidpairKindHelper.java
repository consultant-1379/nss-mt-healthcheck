package BasicConfig;


/**
* BasicConfig/MOidpairKindHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

abstract public class MOidpairKindHelper
{
  private static String  _id = "IDL:BasicConfig/MOidpairKind:1.0";

  public static void insert (org.omg.CORBA.Any a, BasicConfig.MOidpairKind that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static BasicConfig.MOidpairKind extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().create_enum_tc (BasicConfig.MOidpairKindHelper.id (), "MOidpairKind", new String[] { "RefType", "DNType"} );
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static BasicConfig.MOidpairKind read (org.omg.CORBA.portable.InputStream istream)
  {
    return BasicConfig.MOidpairKind.from_int (istream.read_long ());
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, BasicConfig.MOidpairKind value)
  {
    ostream.write_long (value.value ());
  }

}
