package BasicConfig;


/**
* BasicConfig/NotDefined.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class NotDefined extends org.omg.CORBA.UserException
{
  public String info = null;

  public NotDefined ()
  {
    super(NotDefinedHelper.id());
  } // ctor

  public NotDefined (String _info)
  {
    super(NotDefinedHelper.id());
    info = _info;
  } // ctor


  public NotDefined (String $reason, String _info)
  {
    super(NotDefinedHelper.id() + "  " + $reason);
    info = _info;
  } // ctor

} // class NotDefined
