package NotificationIRPSystem;


/**
* NotificationIRPSystem/Attach.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from NotificationIRPSystem_F.idl
* Wednesday, July 11, 2018 2:25:15 PM GMT+01:00
*/

public final class Attach extends org.omg.CORBA.UserException
{
  public String reason = null;

  public Attach ()
  {
    super(AttachHelper.id());
  } // ctor

  public Attach (String _reason)
  {
    super(AttachHelper.id());
    reason = _reason;
  } // ctor


  public Attach (String $reason, String _reason)
  {
    super(AttachHelper.id() + "  " + $reason);
    reason = _reason;
  } // ctor

} // class Attach
