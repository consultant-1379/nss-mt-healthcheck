package ConfigExtended;


/**
* ConfigExtended/MIBChangeInfo.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class MIBChangeInfo implements org.omg.CORBA.portable.IDLEntity
{
  public String localDN = null;
  public ConfigExtended.NotificationKind typeOfChange = null;
  public int generationCount = (int)0;

  public MIBChangeInfo ()
  {
  } // ctor

  public MIBChangeInfo (String _localDN, ConfigExtended.NotificationKind _typeOfChange, int _generationCount)
  {
    localDN = _localDN;
    typeOfChange = _typeOfChange;
    generationCount = _generationCount;
  } // ctor

} // class MIBChangeInfo
