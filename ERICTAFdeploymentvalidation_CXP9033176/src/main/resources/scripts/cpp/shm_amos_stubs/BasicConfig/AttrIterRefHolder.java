package BasicConfig;

/**
* BasicConfig/AttrIterRefHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class AttrIterRefHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.AttrIterRef value = null;

  public AttrIterRefHolder ()
  {
  }

  public AttrIterRefHolder (BasicConfig.AttrIterRef initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.AttrIterRefHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.AttrIterRefHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.AttrIterRefHelper.type ();
  }

}
