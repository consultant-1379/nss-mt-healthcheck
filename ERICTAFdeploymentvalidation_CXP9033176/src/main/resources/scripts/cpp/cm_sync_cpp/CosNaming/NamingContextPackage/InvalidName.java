package CosNaming.NamingContextPackage;


/**
* CosNaming/NamingContextPackage/InvalidName.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNaming.idl
* Friday, June 1, 2018 12:04:26 PM GMT+01:00
*/

public final class InvalidName extends org.omg.CORBA.UserException
{

  public InvalidName ()
  {
    super(InvalidNameHelper.id());
  } // ctor


  public InvalidName (String $reason)
  {
    super(InvalidNameHelper.id() + "  " + $reason);
  } // ctor

} // class InvalidName
