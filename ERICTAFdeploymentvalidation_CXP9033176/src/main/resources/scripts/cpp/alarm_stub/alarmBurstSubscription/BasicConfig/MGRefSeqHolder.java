package BasicConfig;


/**
* BasicConfig/MGRefSeqHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class MGRefSeqHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.MGRef value[] = null;

  public MGRefSeqHolder ()
  {
  }

  public MGRefSeqHolder (BasicConfig.MGRef[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.MGRefSeqHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.MGRefSeqHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.MGRefSeqHelper.type ();
  }

}
