package CosNotification;


/**
* CosNotification/StructuredEvent.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNotification_F.idl
* Wednesday, July 11, 2018 2:25:09 PM GMT+01:00
*/

public final class StructuredEvent implements org.omg.CORBA.portable.IDLEntity
{
  public CosNotification.EventHeader header = null;
  public CosNotification.Property filterable_data[] = null;
  public org.omg.CORBA.Any remainder_of_body = null;

  public StructuredEvent ()
  {
  } // ctor

  public StructuredEvent (CosNotification.EventHeader _header, CosNotification.Property[] _filterable_data, org.omg.CORBA.Any _remainder_of_body)
  {
    header = _header;
    filterable_data = _filterable_data;
    remainder_of_body = _remainder_of_body;
  } // ctor

} // class StructuredEvent
