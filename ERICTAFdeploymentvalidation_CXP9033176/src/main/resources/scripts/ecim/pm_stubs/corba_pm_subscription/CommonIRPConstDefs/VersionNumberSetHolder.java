package CommonIRPConstDefs;


/**
* CommonIRPConstDefs/VersionNumberSetHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CommonIRPConstDefs_E.idl
* Thursday, June 21, 2018 8:22:07 AM GMT+01:00
*/

public final class VersionNumberSetHolder implements org.omg.CORBA.portable.Streamable
{
  public String value[] = null;

  public VersionNumberSetHolder ()
  {
  }

  public VersionNumberSetHolder (String[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CommonIRPConstDefs.VersionNumberSetHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CommonIRPConstDefs.VersionNumberSetHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CommonIRPConstDefs.VersionNumberSetHelper.type ();
  }

}
