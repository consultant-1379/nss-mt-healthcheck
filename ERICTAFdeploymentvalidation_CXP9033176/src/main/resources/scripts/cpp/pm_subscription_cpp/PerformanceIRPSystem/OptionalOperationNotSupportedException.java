package PerformanceIRPSystem;


/**
* PerformanceIRPSystem/OptionalOperationNotSupportedException.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:23 AM GMT+01:00
*/

public final class OptionalOperationNotSupportedException extends org.omg.CORBA.UserException
{

  public OptionalOperationNotSupportedException ()
  {
    super(OptionalOperationNotSupportedExceptionHelper.id());
  } // ctor


  public OptionalOperationNotSupportedException (String $reason)
  {
    super(OptionalOperationNotSupportedExceptionHelper.id() + "  " + $reason);
  } // ctor

} // class OptionalOperationNotSupportedException
