package ConfigExtended;


/**
* ConfigExtended/RequestedAttributeSeqHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class RequestedAttributeSeqHolder implements org.omg.CORBA.portable.Streamable
{
  public ConfigExtended.RequestedAttributes value[] = null;

  public RequestedAttributeSeqHolder ()
  {
  }

  public RequestedAttributeSeqHolder (ConfigExtended.RequestedAttributes[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = ConfigExtended.RequestedAttributeSeqHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    ConfigExtended.RequestedAttributeSeqHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return ConfigExtended.RequestedAttributeSeqHelper.type ();
  }

}
