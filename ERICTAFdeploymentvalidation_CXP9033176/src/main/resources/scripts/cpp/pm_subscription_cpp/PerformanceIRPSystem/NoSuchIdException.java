package PerformanceIRPSystem;


/**
* PerformanceIRPSystem/NoSuchIdException.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:23 AM GMT+01:00
*/

public final class NoSuchIdException extends org.omg.CORBA.UserException
{

  public NoSuchIdException ()
  {
    super(NoSuchIdExceptionHelper.id());
  } // ctor


  public NoSuchIdException (String $reason)
  {
    super(NoSuchIdExceptionHelper.id() + "  " + $reason);
  } // ctor

} // class NoSuchIdException
