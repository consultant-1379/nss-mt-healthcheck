package PerformanceIRPConstDefs;

/**
* PerformanceIRPConstDefs/ObservationClassHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPConstDefs_F.idl
* Thursday, June 21, 2018 8:22:15 AM GMT+01:00
*/

public final class ObservationClassHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPConstDefs.ObservationClass value = null;

  public ObservationClassHolder ()
  {
  }

  public ObservationClassHolder (PerformanceIRPConstDefs.ObservationClass initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPConstDefs.ObservationClassHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPConstDefs.ObservationClassHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPConstDefs.ObservationClassHelper.type ();
  }

}
