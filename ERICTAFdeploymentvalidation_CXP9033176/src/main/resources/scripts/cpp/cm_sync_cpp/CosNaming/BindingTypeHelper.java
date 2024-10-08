package CosNaming;


/**
* CosNaming/BindingTypeHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNaming.idl
* Friday, June 1, 2018 12:04:26 PM GMT+01:00
*/

abstract public class BindingTypeHelper
{
  private static String  _id = "IDL:CosNaming/BindingType:1.0";

  public static void insert (org.omg.CORBA.Any a, CosNaming.BindingType that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static CosNaming.BindingType extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().create_enum_tc (CosNaming.BindingTypeHelper.id (), "BindingType", new String[] { "nobject", "ncontext"} );
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static CosNaming.BindingType read (org.omg.CORBA.portable.InputStream istream)
  {
    return CosNaming.BindingType.from_int (istream.read_long ());
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, CosNaming.BindingType value)
  {
    ostream.write_long (value.value ());
  }

}
