package ManagedGenericIRPConstDefs;

/**
* ManagedGenericIRPConstDefs/StringTypeOptHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from ManagedGenericIRPConstDefs_NMS_C.idl
* Wednesday, July 11, 2018 2:25:14 PM GMT+01:00
*/

public final class StringTypeOptHolder implements org.omg.CORBA.portable.Streamable
{
  public ManagedGenericIRPConstDefs.StringTypeOpt value = null;

  public StringTypeOptHolder ()
  {
  }

  public StringTypeOptHolder (ManagedGenericIRPConstDefs.StringTypeOpt initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = ManagedGenericIRPConstDefs.StringTypeOptHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    ManagedGenericIRPConstDefs.StringTypeOptHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return ManagedGenericIRPConstDefs.StringTypeOptHelper.type ();
  }

}
