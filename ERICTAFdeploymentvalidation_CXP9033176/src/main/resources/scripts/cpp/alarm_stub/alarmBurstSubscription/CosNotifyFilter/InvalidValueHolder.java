package CosNotifyFilter;

/**
* CosNotifyFilter/InvalidValueHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNotifyFilter.idl
* Wednesday, July 11, 2018 2:25:11 PM GMT+01:00
*/

public final class InvalidValueHolder implements org.omg.CORBA.portable.Streamable
{
  public CosNotifyFilter.InvalidValue value = null;

  public InvalidValueHolder ()
  {
  }

  public InvalidValueHolder (CosNotifyFilter.InvalidValue initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CosNotifyFilter.InvalidValueHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CosNotifyFilter.InvalidValueHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CosNotifyFilter.InvalidValueHelper.type ();
  }

}
