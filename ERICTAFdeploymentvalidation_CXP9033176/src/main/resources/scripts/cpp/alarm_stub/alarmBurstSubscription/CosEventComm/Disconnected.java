package CosEventComm;


/**
* CosEventComm/Disconnected.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosEventComm.idl
* Wednesday, July 11, 2018 2:25:08 PM GMT+01:00
*/

public final class Disconnected extends org.omg.CORBA.UserException
{

  public Disconnected ()
  {
    super(DisconnectedHelper.id());
  } // ctor


  public Disconnected (String $reason)
  {
    super(DisconnectedHelper.id() + "  " + $reason);
  } // ctor

} // class Disconnected
