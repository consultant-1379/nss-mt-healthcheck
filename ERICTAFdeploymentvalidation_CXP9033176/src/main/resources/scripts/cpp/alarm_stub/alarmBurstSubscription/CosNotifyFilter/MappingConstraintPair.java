package CosNotifyFilter;


/**
* CosNotifyFilter/MappingConstraintPair.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNotifyFilter.idl
* Wednesday, July 11, 2018 2:25:10 PM GMT+01:00
*/

public final class MappingConstraintPair implements org.omg.CORBA.portable.IDLEntity
{
  public CosNotifyFilter.ConstraintExp constraint_expression = null;
  public org.omg.CORBA.Any result_to_set = null;

  public MappingConstraintPair ()
  {
  } // ctor

  public MappingConstraintPair (CosNotifyFilter.ConstraintExp _constraint_expression, org.omg.CORBA.Any _result_to_set)
  {
    constraint_expression = _constraint_expression;
    result_to_set = _result_to_set;
  } // ctor

} // class MappingConstraintPair
