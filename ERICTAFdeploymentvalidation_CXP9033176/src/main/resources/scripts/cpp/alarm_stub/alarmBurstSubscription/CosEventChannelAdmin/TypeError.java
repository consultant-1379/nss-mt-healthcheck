package CosEventChannelAdmin;


/**
* CosEventChannelAdmin/TypeError.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosEventChannelAdmin.idl
* Wednesday, July 11, 2018 2:25:08 PM GMT+01:00
*/

public final class TypeError extends org.omg.CORBA.UserException
{

  public TypeError ()
  {
    super(TypeErrorHelper.id());
  } // ctor


  public TypeError (String $reason)
  {
    super(TypeErrorHelper.id() + "  " + $reason);
  } // ctor

} // class TypeError
