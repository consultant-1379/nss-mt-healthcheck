package PerformanceIRPSystem;

/**
* PerformanceIRPSystem/ThresholdOperationsHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:23 AM GMT+01:00
*/


//## Subsystem: PerforIRP-1
public final class ThresholdOperationsHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPSystem.ThresholdOperations value = null;

  public ThresholdOperationsHolder ()
  {
  }

  public ThresholdOperationsHolder (PerformanceIRPSystem.ThresholdOperations initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPSystem.ThresholdOperationsHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPSystem.ThresholdOperationsHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPSystem.ThresholdOperationsHelper.type ();
  }

}
