package PerformanceIRPSystem;

/**
* PerformanceIRPSystem/NoSuchIdExceptionHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:23 AM GMT+01:00
*/

public final class NoSuchIdExceptionHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPSystem.NoSuchIdException value = null;

  public NoSuchIdExceptionHolder ()
  {
  }

  public NoSuchIdExceptionHolder (PerformanceIRPSystem.NoSuchIdException initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPSystem.NoSuchIdExceptionHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPSystem.NoSuchIdExceptionHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPSystem.NoSuchIdExceptionHelper.type ();
  }

}
