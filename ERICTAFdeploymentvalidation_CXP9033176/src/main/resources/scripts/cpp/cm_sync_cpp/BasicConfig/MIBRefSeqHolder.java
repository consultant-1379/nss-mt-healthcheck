package BasicConfig;


/**
* BasicConfig/MIBRefSeqHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class MIBRefSeqHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.MIBRef value[] = null;

  public MIBRefSeqHolder ()
  {
  }

  public MIBRefSeqHolder (BasicConfig.MIBRef[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.MIBRefSeqHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.MIBRefSeqHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.MIBRefSeqHelper.type ();
  }

}
