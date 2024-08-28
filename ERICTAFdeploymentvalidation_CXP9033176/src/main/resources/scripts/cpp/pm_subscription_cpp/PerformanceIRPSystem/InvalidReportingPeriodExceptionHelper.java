package PerformanceIRPSystem;


/**
* PerformanceIRPSystem/InvalidReportingPeriodExceptionHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:22 AM GMT+01:00
*/

abstract public class InvalidReportingPeriodExceptionHelper
{
  private static String  _id = "IDL:PerformanceIRPSystem/InvalidReportingPeriodException:1.0";

  public static void insert (org.omg.CORBA.Any a, PerformanceIRPSystem.InvalidReportingPeriodException that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static PerformanceIRPSystem.InvalidReportingPeriodException extract (org.omg.CORBA.Any a)
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
          org.omg.CORBA.StructMember[] _members0 = new org.omg.CORBA.StructMember [0];
          org.omg.CORBA.TypeCode _tcOf_members0 = null;
          __typeCode = org.omg.CORBA.ORB.init ().create_exception_tc (PerformanceIRPSystem.InvalidReportingPeriodExceptionHelper.id (), "InvalidReportingPeriodException", _members0);
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

  public static PerformanceIRPSystem.InvalidReportingPeriodException read (org.omg.CORBA.portable.InputStream istream)
  {
    PerformanceIRPSystem.InvalidReportingPeriodException value = new PerformanceIRPSystem.InvalidReportingPeriodException ();
    // read and discard the repository ID
    istream.read_string ();
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, PerformanceIRPSystem.InvalidReportingPeriodException value)
  {
    // write the repository ID
    ostream.write_string (id ());
  }

}
