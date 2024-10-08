package BasicConfig;


/**
* BasicConfig/ManagedObjectOperations.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_G.idl
* Friday, June 1, 2018 12:05:47 PM GMT+01:00
*/


/**
   * Interface for fine grain solution
   */
public interface ManagedObjectOperations 
{
  void set (CosNaming.NameComponent[] mo, BasicConfig.NameValue[] attributes, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void get (CosNaming.NameComponent[] mo, String[] attributeNames, BasicConfig.NameValueSeqHolder attributes, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MOidpair get_parent (CosNaming.NameComponent[] mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MOidpair[] get_containment (CosNaming.NameComponent[] mo, int scope, BasicConfig.Session session) throws BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MOidpair[] get_association (CosNaming.NameComponent[] mo, String roleName, int scope, BasicConfig.Session session) throws BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  org.omg.CORBA.Any action (CosNaming.NameComponent[] mo, String name, BasicConfig.NameValueSeqHolder parameters, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MOInfo get_info (CosNaming.NameComponent[] mo, BasicConfig.Session session) throws BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void lock (CosNaming.NameComponent[] mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.AlreadyDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void unlock (CosNaming.NameComponent[] mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  boolean is_locked (CosNaming.NameComponent[] mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
} // interface ManagedObjectOperations
