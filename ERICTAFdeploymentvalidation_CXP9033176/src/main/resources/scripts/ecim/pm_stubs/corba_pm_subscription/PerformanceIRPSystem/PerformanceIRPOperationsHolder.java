package PerformanceIRPSystem;

/**
* PerformanceIRPSystem/PerformanceIRPOperationsHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:23 AM GMT+01:00
*/


//## Subsystem: PerforIRP-1
public final class PerformanceIRPOperationsHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPSystem.PerformanceIRPOperations value = null;

  public PerformanceIRPOperationsHolder ()
  {
  }

  public PerformanceIRPOperationsHolder (PerformanceIRPSystem.PerformanceIRPOperations initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPSystem.PerformanceIRPOperationsHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPSystem.PerformanceIRPOperationsHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPSystem.PerformanceIRPOperationsHelper.type ();
  }

}
