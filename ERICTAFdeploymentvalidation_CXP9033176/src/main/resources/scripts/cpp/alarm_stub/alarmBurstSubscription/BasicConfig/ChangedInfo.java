package BasicConfig;


/**
* BasicConfig/ChangedInfo.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public class ChangedInfo implements org.omg.CORBA.portable.IDLEntity
{
  private        int __value;
  private static int __size = 2;
  private static BasicConfig.ChangedInfo[] __array = new BasicConfig.ChangedInfo [__size];

  public static final int _ChangedInfo_CREATED = 0;
  public static final BasicConfig.ChangedInfo ChangedInfo_CREATED = new BasicConfig.ChangedInfo(_ChangedInfo_CREATED);
  public static final int _ChangedInfo_DELETED = 1;
  public static final BasicConfig.ChangedInfo ChangedInfo_DELETED = new BasicConfig.ChangedInfo(_ChangedInfo_DELETED);

  public int value ()
  {
    return __value;
  }

  public static BasicConfig.ChangedInfo from_int (int value)
  {
    if (value >= 0 && value < __size)
      return __array[value];
    else
      throw new org.omg.CORBA.BAD_PARAM ();
  }

  protected ChangedInfo (int value)
  {
    __value = value;
    __array[__value] = this;
  }
} // class ChangedInfo
