package BasicConfig;


/**
* BasicConfig/MOAssociationSeqHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/

public final class MOAssociationSeqHolder implements org.omg.CORBA.portable.Streamable
{
  public BasicConfig.MOAssociation value[] = null;

  public MOAssociationSeqHolder ()
  {
  }

  public MOAssociationSeqHolder (BasicConfig.MOAssociation[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = BasicConfig.MOAssociationSeqHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    BasicConfig.MOAssociationSeqHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return BasicConfig.MOAssociationSeqHelper.type ();
  }

}
