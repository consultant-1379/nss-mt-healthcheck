package PerformanceIRPSystem;

/**
* PerformanceIRPSystem/InvalidObservationClassExceptionHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:22 AM GMT+01:00
*/

public final class InvalidObservationClassExceptionHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPSystem.InvalidObservationClassException value = null;

  public InvalidObservationClassExceptionHolder ()
  {
  }

  public InvalidObservationClassExceptionHolder (PerformanceIRPSystem.InvalidObservationClassException initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPSystem.InvalidObservationClassExceptionHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPSystem.InvalidObservationClassExceptionHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPSystem.InvalidObservationClassExceptionHelper.type ();
  }

}
