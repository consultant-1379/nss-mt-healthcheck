package CelloAlarmIRPExtension;


/**
* CelloAlarmIRPExtension/AlarmIRPExtensionHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CelloAlarmIRPExtension_F.idl
* Wednesday, July 11, 2018 2:25:07 PM GMT+01:00
*/


/*
   * This interface extends the Alarm IRP with Cello specific support
   * for alarm filtering and configuration of severity.
   *
   */
abstract public class AlarmIRPExtensionHelper
{
  private static String  _id = "IDL:CelloAlarmIRPExtension/AlarmIRPExtension:1.0";

  public static void insert (org.omg.CORBA.Any a, CelloAlarmIRPExtension.AlarmIRPExtension that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static CelloAlarmIRPExtension.AlarmIRPExtension extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().create_interface_tc (CelloAlarmIRPExtension.AlarmIRPExtensionHelper.id (), "AlarmIRPExtension");
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static CelloAlarmIRPExtension.AlarmIRPExtension read (org.omg.CORBA.portable.InputStream istream)
  {
    return narrow (istream.read_Object (_AlarmIRPExtensionStub.class));
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, CelloAlarmIRPExtension.AlarmIRPExtension value)
  {
    ostream.write_Object ((org.omg.CORBA.Object) value);
  }

  public static CelloAlarmIRPExtension.AlarmIRPExtension narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof CelloAlarmIRPExtension.AlarmIRPExtension)
      return (CelloAlarmIRPExtension.AlarmIRPExtension)obj;
    else if (!obj._is_a (id ()))
      throw new org.omg.CORBA.BAD_PARAM ();
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      CelloAlarmIRPExtension._AlarmIRPExtensionStub stub = new CelloAlarmIRPExtension._AlarmIRPExtensionStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

  public static CelloAlarmIRPExtension.AlarmIRPExtension unchecked_narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof CelloAlarmIRPExtension.AlarmIRPExtension)
      return (CelloAlarmIRPExtension.AlarmIRPExtension)obj;
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      CelloAlarmIRPExtension._AlarmIRPExtensionStub stub = new CelloAlarmIRPExtension._AlarmIRPExtensionStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

}
