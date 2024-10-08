package CosNaming;


/**
* CosNaming/NamingContextOperations.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosNaming.idl
* Friday, June 1, 2018 12:04:26 PM GMT+01:00
*/

public interface NamingContextOperations 
{
  void bind (CosNaming.NameComponent[] n, org.omg.CORBA.Object obj) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName, CosNaming.NamingContextPackage.AlreadyBound;
  void rebind (CosNaming.NameComponent[] n, org.omg.CORBA.Object obj) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName;
  void bind_context (CosNaming.NameComponent[] n, CosNaming.NamingContext nc) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName, CosNaming.NamingContextPackage.AlreadyBound;
  void rebind_context (CosNaming.NameComponent[] n, CosNaming.NamingContext nc) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName;
  org.omg.CORBA.Object resolve (CosNaming.NameComponent[] n) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName;
  void unbind (CosNaming.NameComponent[] n) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName;
  CosNaming.NamingContext new_context ();
  CosNaming.NamingContext bind_new_context (CosNaming.NameComponent[] n) throws CosNaming.NamingContextPackage.NotFound, CosNaming.NamingContextPackage.CannotProceed, CosNaming.NamingContextPackage.InvalidName, CosNaming.NamingContextPackage.AlreadyBound;
  void destroy () throws CosNaming.NamingContextPackage.NotEmpty;
  void list (int how_many, CosNaming.BindingListHolder bl, CosNaming.BindingIteratorHolder bi);
} // interface NamingContextOperations
