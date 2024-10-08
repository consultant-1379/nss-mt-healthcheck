package PerformanceIRPSystem;


/**
* PerformanceIRPSystem/PerformanceMonitoringOperationsHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceIRPSystem_F.idl
* Thursday, June 21, 2018 8:22:23 AM GMT+01:00
*/


//Performance IRP Operations
abstract public class PerformanceMonitoringOperationsHelper
{
  private static String  _id = "IDL:PerformanceIRPSystem/PerformanceMonitoringOperations:1.0";

  public static void insert (org.omg.CORBA.Any a, PerformanceIRPSystem.PerformanceMonitoringOperations that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static PerformanceIRPSystem.PerformanceMonitoringOperations extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().create_interface_tc (PerformanceIRPSystem.PerformanceMonitoringOperationsHelper.id (), "PerformanceMonitoringOperations");
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static PerformanceIRPSystem.PerformanceMonitoringOperations read (org.omg.CORBA.portable.InputStream istream)
  {
    return narrow (istream.read_Object (_PerformanceMonitoringOperationsStub.class));
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, PerformanceIRPSystem.PerformanceMonitoringOperations value)
  {
    ostream.write_Object ((org.omg.CORBA.Object) value);
  }

  public static PerformanceIRPSystem.PerformanceMonitoringOperations narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof PerformanceIRPSystem.PerformanceMonitoringOperations)
      return (PerformanceIRPSystem.PerformanceMonitoringOperations)obj;
    else if (!obj._is_a (id ()))
      throw new org.omg.CORBA.BAD_PARAM ();
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      PerformanceIRPSystem._PerformanceMonitoringOperationsStub stub = new PerformanceIRPSystem._PerformanceMonitoringOperationsStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

  public static PerformanceIRPSystem.PerformanceMonitoringOperations unchecked_narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof PerformanceIRPSystem.PerformanceMonitoringOperations)
      return (PerformanceIRPSystem.PerformanceMonitoringOperations)obj;
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      PerformanceIRPSystem._PerformanceMonitoringOperationsStub stub = new PerformanceIRPSystem._PerformanceMonitoringOperationsStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

}
