package PerformanceIRPSystem;

/**
* PerformanceIRPSystem/InvalidVersionNumberSyntaxExceptionHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:23 AM GMT+01:00
*/

public final class InvalidVersionNumberSyntaxExceptionHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPSystem.InvalidVersionNumberSyntaxException value = null;

  public InvalidVersionNumberSyntaxExceptionHolder ()
  {
  }

  public InvalidVersionNumberSyntaxExceptionHolder (PerformanceIRPSystem.InvalidVersionNumberSyntaxException initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPSystem.InvalidVersionNumberSyntaxExceptionHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPSystem.InvalidVersionNumberSyntaxExceptionHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPSystem.InvalidVersionNumberSyntaxExceptionHelper.type ();
  }

}
