package CelloAlarmIRPExtension;

/**
* CelloAlarmIRPExtension/FilterTypeKindHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CelloAlarmIRPExtension_F.idl
* Wednesday, July 11, 2018 2:25:07 PM GMT+01:00
*/

public final class FilterTypeKindHolder implements org.omg.CORBA.portable.Streamable
{
  public CelloAlarmIRPExtension.FilterTypeKind value = null;

  public FilterTypeKindHolder ()
  {
  }

  public FilterTypeKindHolder (CelloAlarmIRPExtension.FilterTypeKind initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CelloAlarmIRPExtension.FilterTypeKindHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CelloAlarmIRPExtension.FilterTypeKindHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CelloAlarmIRPExtension.FilterTypeKindHelper.type ();
  }

}
