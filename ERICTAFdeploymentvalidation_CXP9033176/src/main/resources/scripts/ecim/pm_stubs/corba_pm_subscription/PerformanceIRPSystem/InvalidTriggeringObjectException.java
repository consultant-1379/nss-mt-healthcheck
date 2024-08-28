package PerformanceIRPSystem;


/**
* PerformanceIRPSystem/InvalidTriggeringObjectException.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:22 AM GMT+01:00
*/

public final class InvalidTriggeringObjectException extends org.omg.CORBA.UserException
{
  public PerformanceIRPConstDefs.ObservationObject observation_object = null;

  public InvalidTriggeringObjectException ()
  {
    super(InvalidTriggeringObjectExceptionHelper.id());
  } // ctor

  public InvalidTriggeringObjectException (PerformanceIRPConstDefs.ObservationObject _observation_object)
  {
    super(InvalidTriggeringObjectExceptionHelper.id());
    observation_object = _observation_object;
  } // ctor


  public InvalidTriggeringObjectException (String $reason, PerformanceIRPConstDefs.ObservationObject _observation_object)
  {
    super(InvalidTriggeringObjectExceptionHelper.id() + "  " + $reason);
    observation_object = _observation_object;
  } // ctor

} // class InvalidTriggeringObjectException
