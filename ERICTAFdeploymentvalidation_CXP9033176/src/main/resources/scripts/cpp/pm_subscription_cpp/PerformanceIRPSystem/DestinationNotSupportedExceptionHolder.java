package PerformanceIRPSystem;

/**
* PerformanceIRPSystem/DestinationNotSupportedExceptionHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:22 AM GMT+01:00
*/

public final class DestinationNotSupportedExceptionHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPSystem.DestinationNotSupportedException value = null;

  public DestinationNotSupportedExceptionHolder ()
  {
  }

  public DestinationNotSupportedExceptionHolder (PerformanceIRPSystem.DestinationNotSupportedException initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPSystem.DestinationNotSupportedExceptionHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPSystem.DestinationNotSupportedExceptionHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPSystem.DestinationNotSupportedExceptionHelper.type ();
  }

}
