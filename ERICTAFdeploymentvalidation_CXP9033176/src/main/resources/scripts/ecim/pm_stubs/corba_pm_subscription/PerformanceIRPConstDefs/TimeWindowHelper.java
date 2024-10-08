package PerformanceIRPConstDefs;


/**
* PerformanceIRPConstDefs/TimeWindowHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPConstDefs_F.idl
* Thursday, June 21, 2018 8:22:15 AM GMT+01:00
*/


//      Holds a time period pair in the form of seconds before the event and seconds after the event.
abstract public class TimeWindowHelper
{
  private static String  _id = "IDL:PerformanceIRPConstDefs/TimeWindow:1.0";

  public static void insert (org.omg.CORBA.Any a, int[] that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static int[] extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_long);
      __typeCode = org.omg.CORBA.ORB.init ().create_alias_tc (PerformanceIRPConstDefs.TimePeriodInSecondsHelper.id (), "TimePeriodInSeconds", __typeCode);
      __typeCode = org.omg.CORBA.ORB.init ().create_sequence_tc (2, __typeCode);
      __typeCode = org.omg.CORBA.ORB.init ().create_alias_tc (PerformanceIRPConstDefs.TimeWindowHelper.id (), "TimeWindow", __typeCode);
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static int[] read (org.omg.CORBA.portable.InputStream istream)
  {
    int value[] = null;
    int _len0 = istream.read_long ();
    if (_len0 > (2))
      throw new org.omg.CORBA.MARSHAL (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);
    value = new int[_len0];
    for (int _o1 = 0;_o1 < value.length; ++_o1)
      value[_o1] = PerformanceIRPConstDefs.TimePeriodInSecondsHelper.read (istream);
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, int[] value)
  {
    if (value.length > (2))
      throw new org.omg.CORBA.MARSHAL (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);
    ostream.write_long (value.length);
    for (int _i0 = 0;_i0 < value.length; ++_i0)
      PerformanceIRPConstDefs.TimePeriodInSecondsHelper.write (ostream, value[_i0]);
  }

}
