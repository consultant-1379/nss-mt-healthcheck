package CelloAlarmIRPExtension;

/**
* CelloAlarmIRPExtension/RemoveSeverityConfigurationHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CelloAlarmIRPExtension_F.idl
* Wednesday, July 11, 2018 2:25:07 PM GMT+01:00
*/

public final class RemoveSeverityConfigurationHolder implements org.omg.CORBA.portable.Streamable
{
  public CelloAlarmIRPExtension.RemoveSeverityConfiguration value = null;

  public RemoveSeverityConfigurationHolder ()
  {
  }

  public RemoveSeverityConfigurationHolder (CelloAlarmIRPExtension.RemoveSeverityConfiguration initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CelloAlarmIRPExtension.RemoveSeverityConfigurationHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CelloAlarmIRPExtension.RemoveSeverityConfigurationHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CelloAlarmIRPExtension.RemoveSeverityConfigurationHelper.type ();
  }

}
