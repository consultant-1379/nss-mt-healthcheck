package CelloNotificationIRPExtension;


/**
* CelloNotificationIRPExtension/SpecificProblemMOPairListHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CelloNotificationIRPExtension_F.idl
* Wednesday, July 11, 2018 2:25:07 PM GMT+01:00
*/

abstract public class SpecificProblemMOPairListHelper
{
  private static String  _id = "IDL:CelloNotificationIRPExtension/SpecificProblemMOPairList:1.0";

  public static void insert (org.omg.CORBA.Any a, CelloNotificationIRPExtension.SpecificProblemMOPair[] that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static CelloNotificationIRPExtension.SpecificProblemMOPair[] extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = CelloNotificationIRPExtension.SpecificProblemMOPairHelper.type ();
      __typeCode = org.omg.CORBA.ORB.init ().create_sequence_tc (0, __typeCode);
      __typeCode = org.omg.CORBA.ORB.init ().create_alias_tc (CelloNotificationIRPExtension.SpecificProblemMOPairListHelper.id (), "SpecificProblemMOPairList", __typeCode);
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static CelloNotificationIRPExtension.SpecificProblemMOPair[] read (org.omg.CORBA.portable.InputStream istream)
  {
    CelloNotificationIRPExtension.SpecificProblemMOPair value[] = null;
    int _len0 = istream.read_long ();
    value = new CelloNotificationIRPExtension.SpecificProblemMOPair[_len0];
    for (int _o1 = 0;_o1 < value.length; ++_o1)
      value[_o1] = CelloNotificationIRPExtension.SpecificProblemMOPairHelper.read (istream);
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, CelloNotificationIRPExtension.SpecificProblemMOPair[] value)
  {
    ostream.write_long (value.length);
    for (int _i0 = 0;_i0 < value.length; ++_i0)
      CelloNotificationIRPExtension.SpecificProblemMOPairHelper.write (ostream, value[_i0]);
  }

}
