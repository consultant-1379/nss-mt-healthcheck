package se.ericsson.cello.LogAdmin;

/**
* se/ericsson/cello/LogAdmin/LogRecordHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from LogAdmin_F.idl
* Wednesday, July 11, 2018 2:25:14 PM GMT+01:00
*/

public final class LogRecordHolder implements org.omg.CORBA.portable.Streamable
{
  public se.ericsson.cello.LogAdmin.LogRecord value = null;

  public LogRecordHolder ()
  {
  }

  public LogRecordHolder (se.ericsson.cello.LogAdmin.LogRecord initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = se.ericsson.cello.LogAdmin.LogRecordHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    se.ericsson.cello.LogAdmin.LogRecordHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return se.ericsson.cello.LogAdmin.LogRecordHelper.type ();
  }

}
