package ConfigExtended;


/**
* ConfigExtended/ACNotification.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public final class ACNotification implements org.omg.CORBA.portable.IDLEntity
{
  public ConfigExtended.MOInfo moInformation = null;
  public String names[] = null;
  public int generationCount = (int)0;

  public ACNotification ()
  {
  } // ctor

  public ACNotification (ConfigExtended.MOInfo _moInformation, String[] _names, int _generationCount)
  {
    moInformation = _moInformation;
    names = _names;
    generationCount = _generationCount;
  } // ctor

} // class ACNotification
