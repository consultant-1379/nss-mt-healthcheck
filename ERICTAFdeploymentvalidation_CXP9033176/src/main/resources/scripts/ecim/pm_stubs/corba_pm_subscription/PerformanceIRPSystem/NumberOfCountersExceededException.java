package PerformanceIRPSystem;


/**
* PerformanceIRPSystem/NumberOfCountersExceededException.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:23 AM GMT+01:00
*/

public final class NumberOfCountersExceededException extends org.omg.CORBA.UserException
{

  public NumberOfCountersExceededException ()
  {
    super(NumberOfCountersExceededExceptionHelper.id());
  } // ctor


  public NumberOfCountersExceededException (String $reason)
  {
    super(NumberOfCountersExceededExceptionHelper.id() + "  " + $reason);
  } // ctor

} // class NumberOfCountersExceededException
