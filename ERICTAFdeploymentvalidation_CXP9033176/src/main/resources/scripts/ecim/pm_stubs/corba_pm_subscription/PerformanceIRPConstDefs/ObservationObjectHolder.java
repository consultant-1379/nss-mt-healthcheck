package PerformanceIRPConstDefs;

/**
* PerformanceIRPConstDefs/ObservationObjectHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPConstDefs_F.idl
* Thursday, June 21, 2018 8:22:15 AM GMT+01:00
*/

public final class ObservationObjectHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPConstDefs.ObservationObject value = null;

  public ObservationObjectHolder ()
  {
  }

  public ObservationObjectHolder (PerformanceIRPConstDefs.ObservationObject initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPConstDefs.ObservationObjectHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPConstDefs.ObservationObjectHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPConstDefs.ObservationObjectHelper.type ();
  }

}
