package CosNaming;


/**
* CosNaming/BindingType.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNaming.idl
* Tuesday, May 22, 2018 12:36:11 PM GMT+01:00
*/

public class BindingType implements org.omg.CORBA.portable.IDLEntity
{
  private        int __value;
  private static int __size = 2;
  private static CosNaming.BindingType[] __array = new CosNaming.BindingType [__size];

  public static final int _nobject = 0;
  public static final CosNaming.BindingType nobject = new CosNaming.BindingType(_nobject);
  public static final int _ncontext = 1;
  public static final CosNaming.BindingType ncontext = new CosNaming.BindingType(_ncontext);

  public int value ()
  {
    return __value;
  }

  public static CosNaming.BindingType from_int (int value)
  {
    if (value >= 0 && value < __size)
      return __array[value];
    else
      throw new org.omg.CORBA.BAD_PARAM ();
  }

  protected BindingType (int value)
  {
    __value = value;
    __array[__value] = this;
  }
} // class BindingType
