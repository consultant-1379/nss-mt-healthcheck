package CosEventChannelAdmin;


/**
* CosEventChannelAdmin/AlreadyConnected.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosEventChannelAdmin.idl
* Wednesday, July 11, 2018 2:25:08 PM GMT+01:00
*/

public final class AlreadyConnected extends org.omg.CORBA.UserException
{

  public AlreadyConnected ()
  {
    super(AlreadyConnectedHelper.id());
  } // ctor


  public AlreadyConnected (String $reason)
  {
    super(AlreadyConnectedHelper.id() + "  " + $reason);
  } // ctor

} // class AlreadyConnected
