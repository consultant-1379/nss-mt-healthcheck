package ConfigExtended;


/**
* ConfigExtended/AVCNotificationHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

abstract public class AVCNotificationHelper
{
  private static String  _id = "IDL:ConfigExtended/AVCNotification/AVCNotification:1.0";

  public static void insert (org.omg.CORBA.Any a, ConfigExtended.AVCNotification that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static ConfigExtended.AVCNotification extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  private static boolean __active = false;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      synchronized (org.omg.CORBA.TypeCode.class)
      {
        if (__typeCode == null)
        {
          if (__active)
          {
            return org.omg.CORBA.ORB.init().create_recursive_tc ( _id );
          }
          __active = true;
          org.omg.CORBA.StructMember[] _members0 = new org.omg.CORBA.StructMember [3];
          org.omg.CORBA.TypeCode _tcOf_members0 = null;
          _tcOf_members0 = ConfigExtended.MOInfoHelper.type ();
          _members0[0] = new org.omg.CORBA.StructMember (
            "moInformation",
            _tcOf_members0,
            null);
          _tcOf_members0 = ConfigExtended.AttributeNotificationInfoHelper.type ();
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_sequence_tc (0, _tcOf_members0);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (ConfigExtended.AttributeNotificationInfoSeqHelper.id (), "AttributeNotificationInfoSeq", _tcOf_members0);
          _members0[1] = new org.omg.CORBA.StructMember (
            "changedAttributes",
            _tcOf_members0,
            null);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().get_primitive_tc (org.omg.CORBA.TCKind.tk_ulong);
          _tcOf_members0 = org.omg.CORBA.ORB.init ().create_alias_tc (ConfigExtended.GenerationCountTypeHelper.id (), "GenerationCountType", _tcOf_members0);
          _members0[2] = new org.omg.CORBA.StructMember (
            "generationCount",
            _tcOf_members0,
            null);
          __typeCode = org.omg.CORBA.ORB.init ().create_struct_tc (ConfigExtended.AVCNotificationHelper.id (), "AVCNotification", _members0);
          __active = false;
        }
      }
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static ConfigExtended.AVCNotification read (org.omg.CORBA.portable.InputStream istream)
  {
    ConfigExtended.AVCNotification value = new ConfigExtended.AVCNotification ();
    value.moInformation = ConfigExtended.MOInfoHelper.read (istream);
    value.changedAttributes = ConfigExtended.AttributeNotificationInfoSeqHelper.read (istream);
    value.generationCount = istream.read_ulong ();
    return value;
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, ConfigExtended.AVCNotification value)
  {
    ConfigExtended.MOInfoHelper.write (ostream, value.moInformation);
    ConfigExtended.AttributeNotificationInfoSeqHelper.write (ostream, value.changedAttributes);
    ostream.write_ulong (value.generationCount);
  }

}
