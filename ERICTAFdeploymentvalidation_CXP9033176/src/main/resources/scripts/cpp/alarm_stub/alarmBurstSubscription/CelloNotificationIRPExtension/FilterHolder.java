package CelloNotificationIRPExtension;

/**
* CelloNotificationIRPExtension/FilterHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CelloNotificationIRPExtension_F.idl
* Wednesday, July 11, 2018 2:25:07 PM GMT+01:00
*/

public final class FilterHolder implements org.omg.CORBA.portable.Streamable
{
  public CelloNotificationIRPExtension.Filter value = null;

  public FilterHolder ()
  {
  }

  public FilterHolder (CelloNotificationIRPExtension.Filter initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CelloNotificationIRPExtension.FilterHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CelloNotificationIRPExtension.FilterHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CelloNotificationIRPExtension.FilterHelper.type ();
  }

}
