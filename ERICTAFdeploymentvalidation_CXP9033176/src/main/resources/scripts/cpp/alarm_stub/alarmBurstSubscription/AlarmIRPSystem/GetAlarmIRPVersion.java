package AlarmIRPSystem;


/**
* AlarmIRPSystem/GetAlarmIRPVersion.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from AlarmIRPSystem_F.idl
* Wednesday, July 11, 2018 2:25:06 PM GMT+01:00
*/

public final class GetAlarmIRPVersion extends org.omg.CORBA.UserException
{
  public String reason = null;

  public GetAlarmIRPVersion ()
  {
    super(GetAlarmIRPVersionHelper.id());
  } // ctor

  public GetAlarmIRPVersion (String _reason)
  {
    super(GetAlarmIRPVersionHelper.id());
    reason = _reason;
  } // ctor


  public GetAlarmIRPVersion (String $reason, String _reason)
  {
    super(GetAlarmIRPVersionHelper.id() + "  " + $reason);
    reason = _reason;
  } // ctor

} // class GetAlarmIRPVersion
