package CelloAlarmIRPExtension;


/**
* CelloAlarmIRPExtension/SeverityInfo.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CelloAlarmIRPExtension_F.idl
* Wednesday, July 11, 2018 2:25:07 PM GMT+01:00
*/

public final class SeverityInfo implements org.omg.CORBA.portable.IDLEntity
{
  public short severity = (short)0;
  public String specific_problem = null;

  public SeverityInfo ()
  {
  } // ctor

  public SeverityInfo (short _severity, String _specific_problem)
  {
    severity = _severity;
    specific_problem = _specific_problem;
  } // ctor

} // class SeverityInfo
