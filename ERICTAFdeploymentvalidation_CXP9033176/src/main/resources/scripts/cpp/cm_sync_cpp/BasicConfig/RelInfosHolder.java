package BasicConfig;


/**
* BasicConfig/RelInfosHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class RelInfosHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.RelInfo value[] = null;

  public RelInfosHolder ()
  {
  }

  public RelInfosHolder (BasicConfig.RelInfo[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.RelInfosHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.RelInfosHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.RelInfosHelper.type ();
  }

}
