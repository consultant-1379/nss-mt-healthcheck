package BasicConfig;


/**
* BasicConfig/NameValueSeqHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class NameValueSeqHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.NameValue value[] = null;

  public NameValueSeqHolder ()
  {
  }

  public NameValueSeqHolder (BasicConfig.NameValue[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.NameValueSeqHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.NameValueSeqHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.NameValueSeqHelper.type ();
  }

}
