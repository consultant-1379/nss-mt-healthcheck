package BasicConfig;

/**
* BasicConfig/ProcessingFailureHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:11 PM GMT+01:00
*/

public final class ProcessingFailureHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.ProcessingFailure value = null;

  public ProcessingFailureHolder ()
  {
  }

  public ProcessingFailureHolder (BasicConfig.ProcessingFailure initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.ProcessingFailureHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.ProcessingFailureHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.ProcessingFailureHelper.type ();
  }

}
