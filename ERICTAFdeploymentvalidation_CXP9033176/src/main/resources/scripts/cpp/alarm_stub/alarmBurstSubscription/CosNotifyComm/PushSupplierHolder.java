package CosNotifyComm;

/**
* CosNotifyComm/PushSupplierHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNotifyComm.idl
* Wednesday, July 11, 2018 2:25:10 PM GMT+01:00
*/


// PullSupplier
public final class PushSupplierHolder implements org.omg.CORBA.portable.Streamable
{
  public CosNotifyComm.PushSupplier value = null;

  public PushSupplierHolder ()
  {
  }

  public PushSupplierHolder (CosNotifyComm.PushSupplier initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CosNotifyComm.PushSupplierHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CosNotifyComm.PushSupplierHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CosNotifyComm.PushSupplierHelper.type ();
  }

}
