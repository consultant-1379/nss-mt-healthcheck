package CelloNotificationIRPExtension;


/**
* CelloNotificationIRPExtension/SpecificProblemMOPairListHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CelloNotificationIRPExtension_F.idl
* Wednesday, July 11, 2018 2:25:07 PM GMT+01:00
*/

public final class SpecificProblemMOPairListHolder implements org.omg.CORBA.portable.Streamable
{
  public CelloNotificationIRPExtension.SpecificProblemMOPair value[] = null;

  public SpecificProblemMOPairListHolder ()
  {
  }

  public SpecificProblemMOPairListHolder (CelloNotificationIRPExtension.SpecificProblemMOPair[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = CelloNotificationIRPExtension.SpecificProblemMOPairListHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    CelloNotificationIRPExtension.SpecificProblemMOPairListHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return CelloNotificationIRPExtension.SpecificProblemMOPairListHelper.type ();
  }

}
