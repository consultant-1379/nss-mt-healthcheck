package PerformanceIRPConstDefs;

/**
* PerformanceIRPConstDefs/AttrTypeHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPConstDefs_F.idl
* Thursday, June 21, 2018 8:22:15 AM GMT+01:00
*/

public final class AttrTypeHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPConstDefs.AttrType value = null;

  public AttrTypeHolder ()
  {
  }

  public AttrTypeHolder (PerformanceIRPConstDefs.AttrType initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPConstDefs.AttrTypeHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPConstDefs.AttrTypeHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPConstDefs.AttrTypeHelper.type ();
  }

}
