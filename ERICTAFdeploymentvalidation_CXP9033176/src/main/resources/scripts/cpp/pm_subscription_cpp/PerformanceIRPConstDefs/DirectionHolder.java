package PerformanceIRPConstDefs;

/**
* PerformanceIRPConstDefs/DirectionHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPConstDefs_F.idl
* Thursday, June 21, 2018 8:22:15 AM GMT+01:00
*/

public final class DirectionHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPConstDefs.Direction value = null;

  public DirectionHolder ()
  {
  }

  public DirectionHolder (PerformanceIRPConstDefs.Direction initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPConstDefs.DirectionHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPConstDefs.DirectionHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPConstDefs.DirectionHelper.type ();
  }

}
