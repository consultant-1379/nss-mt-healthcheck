package TimeBase;


/**
* TimeBase/IntervalT.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from TimeBase.idl
* Wednesday, July 11, 2018 2:25:15 PM GMT+01:00
*/

public final class IntervalT implements org.omg.CORBA.portable.IDLEntity
{
  public long lower_bound = (long)0;
  public long upper_bound = (long)0;

  public IntervalT ()
  {
  } // ctor

  public IntervalT (long _lower_bound, long _upper_bound)
  {
    lower_bound = _lower_bound;
    upper_bound = _upper_bound;
  } // ctor

} // class IntervalT
