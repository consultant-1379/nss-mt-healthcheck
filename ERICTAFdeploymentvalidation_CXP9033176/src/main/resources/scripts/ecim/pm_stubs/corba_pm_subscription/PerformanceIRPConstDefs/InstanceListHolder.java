package PerformanceIRPConstDefs;


/**
* PerformanceIRPConstDefs/InstanceListHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPConstDefs_F.idl
* Thursday, June 21, 2018 8:22:15 AM GMT+01:00
*/


//      A list of observed object instances
public final class InstanceListHolder implements org.omg.CORBA.portable.Streamable
{
  public String value[] = null;

  public InstanceListHolder ()
  {
  }

  public InstanceListHolder (String[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPConstDefs.InstanceListHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPConstDefs.InstanceListHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPConstDefs.InstanceListHelper.type ();
  }

}
