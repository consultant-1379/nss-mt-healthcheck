package CosNaming;


/**
* CosNaming/Binding.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNaming.idl
* Tuesday, May 22, 2018 12:36:11 PM GMT+01:00
*/

public final class Binding implements org.omg.CORBA.portable.IDLEntity
{
  public CosNaming.NameComponent binding_name[] = null;
  public CosNaming.BindingType binding_type = null;

  public Binding ()
  {
  } // ctor

  public Binding (CosNaming.NameComponent[] _binding_name, CosNaming.BindingType _binding_type)
  {
    binding_name = _binding_name;
    binding_type = _binding_type;
  } // ctor

} // class Binding
