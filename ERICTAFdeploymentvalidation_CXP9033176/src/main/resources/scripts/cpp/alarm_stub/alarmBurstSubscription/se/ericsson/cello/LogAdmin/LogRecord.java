package se.ericsson.cello.LogAdmin;


/**
* se/ericsson/cello/LogAdmin/LogRecord.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from LogAdmin_F.idl
* Wednesday, July 11, 2018 2:25:14 PM GMT+01:00
*/

public final class LogRecord implements org.omg.CORBA.portable.IDLEntity
{

  // Contains a unique number assigned by the log.
  public long id = (long)0;

  // Indicates the time the record is logged.
  public se.ericsson.cello.LogAdmin.TimeT time = null;

  // Contains the logged information.
  public CosNotification.StructuredEvent structEvt = null;

  public LogRecord ()
  {
  } // ctor

  public LogRecord (long _id, se.ericsson.cello.LogAdmin.TimeT _time, CosNotification.StructuredEvent _structEvt)
  {
    id = _id;
    time = _time;
    structEvt = _structEvt;
  } // ctor

} // class LogRecord
