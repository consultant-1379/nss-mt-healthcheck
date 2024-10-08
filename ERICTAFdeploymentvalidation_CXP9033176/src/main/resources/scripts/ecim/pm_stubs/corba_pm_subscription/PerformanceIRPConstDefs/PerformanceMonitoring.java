package PerformanceIRPConstDefs;


/**
* PerformanceIRPConstDefs/PerformanceMonitoring.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPConstDefs_F.idl
* Thursday, June 21, 2018 8:22:15 AM GMT+01:00
*/

public final class PerformanceMonitoring implements org.omg.CORBA.portable.IDLEntity
{
  public int performance_monitoring_id = (int)0;
  public String measurement_name = null;
  public PerformanceIRPConstDefs.PerformanceMonitoringState state = null;

  public PerformanceMonitoring ()
  {
  } // ctor

  public PerformanceMonitoring (int _performance_monitoring_id, String _measurement_name, PerformanceIRPConstDefs.PerformanceMonitoringState _state)
  {
    performance_monitoring_id = _performance_monitoring_id;
    measurement_name = _measurement_name;
    state = _state;
  } // ctor

} // class PerformanceMonitoring
