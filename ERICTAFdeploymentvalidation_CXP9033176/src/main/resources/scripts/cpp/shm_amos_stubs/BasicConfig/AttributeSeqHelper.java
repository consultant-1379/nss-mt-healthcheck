package BasicConfig;


/**
* BasicConfig/AttributeSeqHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

abstract public class AttributeSeqHelper
{
  private static String  _id = "IDL:BasicConfig/AttributeSeq:1.0";

  public static void insert (org.omg.CORBA.Any a, BasicConfig.NameValue[] that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static BasicConfig.NameValue[] extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = BasicConfig.NameValueHelper.type ();
      __typeCode = org.omg.CORBA.ORB.init ().create_sequence_tc (0, __typeCode);
      __typeCode = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.NameValueSeqHelper.id (), "NameValueSeq", __typeCode);
      __typeCode = org.omg.CORBA.ORB.init ().create_alias_tc (BasicConfig.AttributeSeqHelper.id (), "AttributeSeq", __typeCode);
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static BasicConfig.NameValue[] read (org.omg.CORBA.portable.InputStream istream)
  {
    BasicConfig.NameValue value[] = null;
    value = BasicConfig.NameValueSeqHelper.read (istream);
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, BasicConfig.NameValue[] value)
  {
    BasicConfig.NameValueSeqHelper.write (ostream, value);
  }

}
