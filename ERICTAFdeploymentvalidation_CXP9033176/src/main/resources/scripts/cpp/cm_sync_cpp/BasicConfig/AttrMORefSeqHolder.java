package BasicConfig;


/**
* BasicConfig/AttrMORefSeqHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class AttrMORefSeqHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.AttrMORef value[] = null;

  public AttrMORefSeqHolder ()
  {
  }

  public AttrMORefSeqHolder (BasicConfig.AttrMORef[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.AttrMORefSeqHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.AttrMORefSeqHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.AttrMORefSeqHelper.type ();
  }

}
