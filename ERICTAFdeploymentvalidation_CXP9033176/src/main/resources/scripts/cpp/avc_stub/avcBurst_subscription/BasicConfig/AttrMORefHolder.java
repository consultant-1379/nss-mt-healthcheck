package BasicConfig;

/**
* BasicConfig/AttrMORefHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class AttrMORefHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.AttrMORef value = null;

  public AttrMORefHolder ()
  {
  }

  public AttrMORefHolder (BasicConfig.AttrMORef initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.AttrMORefHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.AttrMORefHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.AttrMORefHelper.type ();
  }

}
