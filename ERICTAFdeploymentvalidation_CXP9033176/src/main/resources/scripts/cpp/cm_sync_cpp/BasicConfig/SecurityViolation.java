package BasicConfig;


/**
* BasicConfig/SecurityViolation.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class SecurityViolation extends org.omg.CORBA.UserException
{
  public String reason = null;

  public SecurityViolation ()
  {
    super(SecurityViolationHelper.id());
  } // ctor

  public SecurityViolation (String _reason)
  {
    super(SecurityViolationHelper.id());
    reason = _reason;
  } // ctor


  public SecurityViolation (String $reason, String _reason)
  {
    super(SecurityViolationHelper.id() + "  " + $reason);
    reason = _reason;
  } // ctor

} // class SecurityViolation
