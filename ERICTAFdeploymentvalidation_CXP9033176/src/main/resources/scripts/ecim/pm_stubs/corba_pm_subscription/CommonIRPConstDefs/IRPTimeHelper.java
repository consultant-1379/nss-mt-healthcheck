package CommonIRPConstDefs;


/**
* CommonIRPConstDefs/IRPTimeHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CommonIRPConstDefs_E.idl
* Thursday, June 21, 2018 8:22:07 AM GMT+01:00
*/


/* 
  Definition imported from CosTime.  The time refers to time in Greenwich
  Time Zone.  It also consists of a time displacement factor in the form
  of minutes of displacement from the Greenwich Meridian.
  */
abstract public class IRPTimeHelper
{
  private static String  _id = "IDL:CommonIRPConstDefs/IRPTime:1.0";

  public static void insert (org.omg.CORBA.Any a, TimeBase.UtcT that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static TimeBase.UtcT extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = TimeBase.UtcTHelper.type ();
      __typeCode = org.omg.CORBA.ORB.init ().create_alias_tc (CommonIRPConstDefs.IRPTimeHelper.id (), "IRPTime", __typeCode);
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static TimeBase.UtcT read (org.omg.CORBA.portable.InputStream istream)
  {
    TimeBase.UtcT value = null;
    value = TimeBase.UtcTHelper.read (istream);
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, TimeBase.UtcT value)
  {
    TimeBase.UtcTHelper.write (ostream, value);
  }

}
