package PerformanceIRPConstDefs;

/**
* PerformanceIRPConstDefs/PerformanceMonitoringReportHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPConstDefs_F.idl
* Thursday, June 21, 2018 8:22:15 AM GMT+01:00
*/

public final class PerformanceMonitoringReportHolder implements org.omg.CORBA.portable.Streamable
{
  public PerformanceIRPConstDefs.PerformanceMonitoringReport value = null;

  public PerformanceMonitoringReportHolder ()
  {
  }

  public PerformanceMonitoringReportHolder (PerformanceIRPConstDefs.PerformanceMonitoringReport initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = PerformanceIRPConstDefs.PerformanceMonitoringReportHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    PerformanceIRPConstDefs.PerformanceMonitoringReportHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return PerformanceIRPConstDefs.PerformanceMonitoringReportHelper.type ();
  }

}
