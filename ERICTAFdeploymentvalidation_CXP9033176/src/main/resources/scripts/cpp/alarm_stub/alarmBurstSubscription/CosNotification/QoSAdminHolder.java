package CosNotification;

/**
* CosNotification/QoSAdminHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNotification_F.idl
* Wednesday, July 11, 2018 2:25:09 PM GMT+01:00
*/


// MaxEventsPerConsumer takes on a value of type long
public final class QoSAdminHolder implements org.omg.CORBA.portable.Streamable
{
  public CosNotification.QoSAdmin value = null;

  public QoSAdminHolder ()
  {
  }

  public QoSAdminHolder (CosNotification.QoSAdmin initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CosNotification.QoSAdminHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CosNotification.QoSAdminHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CosNotification.QoSAdminHelper.type ();
  }

}
