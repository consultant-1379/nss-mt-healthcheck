package CosEventChannelAdmin;

/**
* CosEventChannelAdmin/EventChannelHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosEventChannelAdmin.idl
* Wednesday, July 11, 2018 2:25:08 PM GMT+01:00
*/

public final class EventChannelHolder implements org.omg.CORBA.portable.Streamable
{
  public CosEventChannelAdmin.EventChannel value = null;

  public EventChannelHolder ()
  {
  }

  public EventChannelHolder (CosEventChannelAdmin.EventChannel initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CosEventChannelAdmin.EventChannelHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CosEventChannelAdmin.EventChannelHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CosEventChannelAdmin.EventChannelHelper.type ();
  }

}
