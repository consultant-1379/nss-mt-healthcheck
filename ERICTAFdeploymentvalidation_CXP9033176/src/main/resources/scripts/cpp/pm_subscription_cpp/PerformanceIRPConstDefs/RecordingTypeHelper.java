package PerformanceIRPConstDefs;


/**
* PerformanceIRPConstDefs/RecordingTypeHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPConstDefs_F.idl
* Thursday, June 21, 2018 8:22:15 AM GMT+01:00
*/

abstract public class RecordingTypeHelper
{
  private static String  _id = "IDL:PerformanceIRPConstDefs/RecordingType:1.0";

  public static void insert (org.omg.CORBA.Any a, PerformanceIRPConstDefs.RecordingType that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static PerformanceIRPConstDefs.RecordingType extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().create_enum_tc (PerformanceIRPConstDefs.RecordingTypeHelper.id (), "RecordingType", new String[] { "EVENT_DATA", "MEASUREMENT_DATA", "EVENT_AND_MESUREMENT_DATA"} );
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static PerformanceIRPConstDefs.RecordingType read (org.omg.CORBA.portable.InputStream istream)
  {
    return PerformanceIRPConstDefs.RecordingType.from_int (istream.read_long ());
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, PerformanceIRPConstDefs.RecordingType value)
  {
    ostream.write_long (value.value ());
  }

}
