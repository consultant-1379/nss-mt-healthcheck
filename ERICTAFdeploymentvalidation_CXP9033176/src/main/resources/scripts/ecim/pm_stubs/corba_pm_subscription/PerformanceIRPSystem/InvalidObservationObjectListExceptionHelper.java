package PerformanceIRPSystem;


/**
* PerformanceIRPSystem/InvalidObservationObjectListExceptionHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:22 AM GMT+01:00
*/

abstract public class InvalidObservationObjectListExceptionHelper
{
  private static String  _id = "IDL:PerformanceIRPSystem/InvalidObservationObjectListException:1.0";

  public static void insert (org.omg.CORBA.Any a, PerformanceIRPSystem.InvalidObservationObjectListException that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static PerformanceIRPSystem.InvalidObservationObjectListException extract (org.omg.CORBA.Any a)
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
          org.omg.CORBA.StructMember[] _members0 = new org.omg.CORBA.StructMember [1];
          org.omg.CORBA.TypeCode _tcOf_members0 = null;
          _tcOf_members0 = PerformanceIRPConstDefs.ObservationObjectHelper.type ();
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_sequence_tc (0, _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (PerformanceIRPConstDefs.ObservationObjectListHelper.id (), "ObservationObjectList", _tcOf_members0);
          _members0[0] = new org.omg.CORBA.StructMember (
            "observation_object_list",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_exception_tc (PerformanceIRPSystem.InvalidObservationObjectListExceptionHelper.id (), "InvalidObservationObjectListException", _members0);
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

  public static PerformanceIRPSystem.InvalidObservationObjectListException read (org.omg.CORBA.portable.InputStream istream)
  {
    PerformanceIRPSystem.InvalidObservationObjectListException value = new PerformanceIRPSystem.InvalidObservationObjectListException ();
    // read and discard the repository ID
    istream.read_string ();
    value.observation_object_list = PerformanceIRPConstDefs.ObservationObjectListHelper.read (istream);
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, PerformanceIRPSystem.InvalidObservationObjectListException value)
  {
    // write the repository ID
    ostream.write_string (id ());
    PerformanceIRPConstDefs.ObservationObjectListHelper.write (ostream, value.observation_object_list);
  }

}
