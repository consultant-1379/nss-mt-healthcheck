package PerformanceIRPSystem;


/**
* PerformanceIRPSystem/InvalidObservationClassException.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:22 AM GMT+01:00
*/

public final class InvalidObservationClassException extends org.omg.CORBA.UserException
{
  public PerformanceIRPConstDefs.ObservationClass observation_class_list[] = null;

  public InvalidObservationClassException ()
  {
    super(InvalidObservationClassExceptionHelper.id());
  } // ctor

  public InvalidObservationClassException (PerformanceIRPConstDefs.ObservationClass[] _observation_class_list)
  {
    super(InvalidObservationClassExceptionHelper.id());
    observation_class_list = _observation_class_list;
  } // ctor


  public InvalidObservationClassException (String $reason, PerformanceIRPConstDefs.ObservationClass[] _observation_class_list)
  {
    super(InvalidObservationClassExceptionHelper.id() + "  " + $reason);
    observation_class_list = _observation_class_list;
  } // ctor

} // class InvalidObservationClassException
