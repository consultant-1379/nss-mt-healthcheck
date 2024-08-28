package ConfigExtended;


/**
* ConfigExtended/NotificationKindHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

abstract public class NotificationKindHelper
{
  private static String  _id = "IDL:ConfigExtended/NotificationKind:1.0";

  public static void insert (org.omg.CORBA.Any a, ConfigExtended.NotificationKind that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static ConfigExtended.NotificationKind extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().create_enum_tc (ConfigExtended.NotificationKindHelper.id (), "NotificationKind", new String[] { "MOCreatedType", "MODeletedType", "AVCType", "ACType", "SequenceDeltaType", "OverflowType"} );
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static ConfigExtended.NotificationKind read (org.omg.CORBA.portable.InputStream istream)
  {
    return ConfigExtended.NotificationKind.from_int (istream.read_long ());
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, ConfigExtended.NotificationKind value)
  {
    ostream.write_long (value.value ());
  }

}
