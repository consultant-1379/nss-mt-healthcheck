package PmServiceExtended;


/**
* PmServiceExtended/PerformanceMonitoringExtendedHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from PerformanceMonitoringServiceExtended_F.idl
* Thursday, June 21, 2018 8:22:31 AM GMT+01:00
*/


/**
   * This interface is an extension of the Performance IRP 2:2 which is used for new additions to PMCI.
    *
    */
abstract public class PerformanceMonitoringExtendedHelper
{
  private static String  _id = "IDL:PmServiceExtended/PerformanceMonitoringExtended:1.0";

  public static void insert (org.omg.CORBA.Any a, PmServiceExtended.PerformanceMonitoringExtended that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static PmServiceExtended.PerformanceMonitoringExtended extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().create_interface_tc (PmServiceExtended.PerformanceMonitoringExtendedHelper.id (), "PerformanceMonitoringExtended");
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static PmServiceExtended.PerformanceMonitoringExtended read (org.omg.CORBA.portable.InputStream istream)
  {
    return narrow (istream.read_Object (_PerformanceMonitoringExtendedStub.class));
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, PmServiceExtended.PerformanceMonitoringExtended value)
  {
    ostream.write_Object ((org.omg.CORBA.Object) value);
  }

  public static PmServiceExtended.PerformanceMonitoringExtended narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof PmServiceExtended.PerformanceMonitoringExtended)
      return (PmServiceExtended.PerformanceMonitoringExtended)obj;
    else if (!obj._is_a(id ()))
      throw new org.omg.CORBA.BAD_PARAM ();
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      PmServiceExtended._PerformanceMonitoringExtendedStub stub = new PmServiceExtended._PerformanceMonitoringExtendedStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

  public static PmServiceExtended.PerformanceMonitoringExtended unchecked_narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof PmServiceExtended.PerformanceMonitoringExtended)
      return (PmServiceExtended.PerformanceMonitoringExtended)obj;
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      PmServiceExtended._PerformanceMonitoringExtendedStub stub = new PmServiceExtended._PerformanceMonitoringExtendedStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

}
