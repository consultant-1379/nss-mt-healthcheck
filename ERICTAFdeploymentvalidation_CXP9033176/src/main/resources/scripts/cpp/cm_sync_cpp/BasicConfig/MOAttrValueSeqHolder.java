package BasicConfig;


/**
* BasicConfig/MOAttrValueSeqHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class MOAttrValueSeqHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.MOAttrValue value[] = null;

  public MOAttrValueSeqHolder ()
  {
  }

  public MOAttrValueSeqHolder (BasicConfig.MOAttrValue[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.MOAttrValueSeqHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.MOAttrValueSeqHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.MOAttrValueSeqHelper.type ();
  }

}
