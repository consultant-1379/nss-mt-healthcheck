package PerformanceIRPSystem;

/**
* PerformanceIRPSystem/InvalidNetworkElementHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:22 AM GMT+01:00
*/

public final class InvalidNetworkElementHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPSystem.InvalidNetworkElement value = null;

  public InvalidNetworkElementHolder ()
  {
  }

  public InvalidNetworkElementHolder (PerformanceIRPSystem.InvalidNetworkElement initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPSystem.InvalidNetworkElementHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPSystem.InvalidNetworkElementHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPSystem.InvalidNetworkElementHelper.type ();
  }

}
