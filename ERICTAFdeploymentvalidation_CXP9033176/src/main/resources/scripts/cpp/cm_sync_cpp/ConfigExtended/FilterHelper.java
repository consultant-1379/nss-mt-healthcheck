package ConfigExtended;


/**
* ConfigExtended/FilterHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_G.idl
* Friday, June 1, 2018 12:05:52 PM GMT+01:00
*/

abstract public class FilterHelper
{
  private static String  _id = "IDL:ConfigExtended/Filter:1.0";

  public static void insert (org.omg.CORBA.Any a, BasicConfig.Filter that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static BasicConfig.Filter extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = BasicConfig.FilterHelper.type ();
      __typeCode = org.omg.CORBA.ORB.init ().create_alias_tc (ConfigExtended.FilterHelper.id (), "Filter", __typeCode);
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static BasicConfig.Filter read (org.omg.CORBA.portable.InputStream istream)
  {
    BasicConfig.Filter value = null;
    value = BasicConfig.FilterHelper.read (istream);
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, BasicConfig.Filter value)
  {
    BasicConfig.FilterHelper.write (ostream, value);
  }

}
