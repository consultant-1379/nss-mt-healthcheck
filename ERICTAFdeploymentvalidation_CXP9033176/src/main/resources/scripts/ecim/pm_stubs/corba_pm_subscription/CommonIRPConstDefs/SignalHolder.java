package CommonIRPConstDefs;

/**
* CommonIRPConstDefs/SignalHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CommonIRPConstDefs_E.idl
* Thursday, June 21, 2018 8:22:07 AM GMT+01:00
*/

public final class SignalHolder implements org.omg.CORBA.portable.Streamable
{
  public CommonIRPConstDefs.Signal value = null;

  public SignalHolder ()
  {
  }

  public SignalHolder (CommonIRPConstDefs.Signal initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CommonIRPConstDefs.SignalHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CommonIRPConstDefs.SignalHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CommonIRPConstDefs.SignalHelper.type ();
  }

}
