package Config;


/**
* Config/ConfigRefSeqHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class ConfigRefSeqHolder implements org.omg.CORBA.portable.Streamable
{
  public Config.ConfigRef value[] = null;

  public ConfigRefSeqHolder ()
  {
  }

  public ConfigRefSeqHolder (Config.ConfigRef[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = Config.ConfigRefSeqHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    Config.ConfigRefSeqHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return Config.ConfigRefSeqHelper.type ();
  }

}
