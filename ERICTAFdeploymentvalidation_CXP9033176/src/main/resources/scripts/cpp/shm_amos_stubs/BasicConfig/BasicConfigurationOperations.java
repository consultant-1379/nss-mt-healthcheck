package BasicConfig;


/**
* BasicConfig/BasicConfigurationOperations.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/


/**
   * BasicConfiguration interface
   */
public interface BasicConfigurationOperations 
{

  /**
       * Methods for Session
       */
  BasicConfig.Session create_session (String id, int idleTimeout) throws BasicConfig.ProcessingFailure;

  /**
       * Methods for MIB.
       */
  BasicConfig.MIBRef create_MIB (String name, String type, String version, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void delete_MIB (BasicConfig.MIBRef mib, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MIBRef get_MIB (String name, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MIBRef[] get_MIBs (BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MORef basic_create_root_MO (String name, String type, BasicConfig.NameValue[] attributes, BasicConfig.MOAssociation[] associations, BasicConfig.MIBRef mib, BasicConfig.Session session) throws BasicConfig.ProcessingFailure, BasicConfig.SecurityViolation, BasicConfig.NotDefined, BasicConfig.AlreadyDefined;
  BasicConfig.MORef basic_get_root_MO (BasicConfig.MIBRef mib, BasicConfig.Session session) throws BasicConfig.ProcessingFailure, BasicConfig.SecurityViolation, BasicConfig.NotDefined;
  BasicConfig.MIBInfo get_MIB_info (BasicConfig.MIBRef mib, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void set_MIM_version (BasicConfig.MIBRef mib, String version, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void set_prefix_MIB (BasicConfig.MIBRef mib, CosNaming.NameComponent[] prefix, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /**
       * Methods for Managed Group
       */
  BasicConfig.MGRef create_MG (String name, BasicConfig.MORef[] mos, BasicConfig.Filter filter, int scope, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void delete_MG (BasicConfig.MGRef mg, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MGRef[] get_MGs (BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MGRef get_MG (int id, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.IterRef get_MG_contents_short (BasicConfig.MGRef mg, org.omg.CORBA.IntHolder count, BasicConfig.MORefSeqHolder result, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.ExtIterRef get_MG_contents_full (BasicConfig.MGRef mg, org.omg.CORBA.IntHolder count, BasicConfig.ExtMORefSeqHolder result, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MGInfo get_MG_info (BasicConfig.MGRef mg, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void add_MO_to_MG (BasicConfig.MGRef mg, BasicConfig.MORef[] mos, BasicConfig.Filter filter, int scope, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void remove_MO_from_MG (BasicConfig.MGRef mg, BasicConfig.MORef[] mos, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /**
       * Methods for MOs
       */
  BasicConfig.MORef basic_create_MO (String name, String type, BasicConfig.MOidpair baseMO, BasicConfig.MOidpair sourceMO, BasicConfig.NameValue[] attributes, BasicConfig.MOAssociation[] associations, BasicConfig.Session session) throws BasicConfig.AlreadyDefined, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void basic_delete_MO (BasicConfig.MOidpair baseMO, BasicConfig.MGRef mg, int scope, BasicConfig.Filter filter, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.IterRef basic_set_MO (BasicConfig.MOidpair baseMO, BasicConfig.MGRef mg, int scope, BasicConfig.Filter filter, BasicConfig.NameValue[] attributes, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.IterRef basic_get_MO_containment_short (BasicConfig.MOidpair baseMO, BasicConfig.MGRef mg, int scope, BasicConfig.Filter filter, org.omg.CORBA.IntHolder count, BasicConfig.MORefSeqHolder result, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.ExtIterRef basic_get_MO_containment_full (BasicConfig.MOidpair baseMO, BasicConfig.MGRef mg, int scope, BasicConfig.Filter filter, org.omg.CORBA.IntHolder count, BasicConfig.ExtMORefSeqHolder result, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.AttrIterRef basic_get_attr_MO_containment (BasicConfig.MOidpair baseMO, int scope, BasicConfig.Filter filter, String[] attributeNames, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.IterRef basic_get_MO_association_short (BasicConfig.MOidpair baseMO, String roleName, BasicConfig.MGRef mg, int scope, BasicConfig.Filter filter, org.omg.CORBA.IntHolder count, BasicConfig.MORefSeqHolder result, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.ExtIterRef basic_get_MO_association_full (BasicConfig.MOidpair baseMO, String roleName, BasicConfig.MGRef mg, int scope, BasicConfig.Filter filter, org.omg.CORBA.IntHolder count, BasicConfig.ExtMORefSeqHolder result, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.AttrIterRef basic_get_attr_MO_association (BasicConfig.MOidpair baseMO, String roleName, int scope, BasicConfig.Filter filter, String[] attributeNames, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  boolean basic_is_existing (BasicConfig.MOidpair mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void basic_create_association (BasicConfig.MOidpair fromMO, BasicConfig.MOAssociation[] associations, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.AlreadyDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void basic_delete_association (BasicConfig.MOidpair fromMO, BasicConfig.MOAssociation[] associations, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void basic_lock_MO (BasicConfig.MOidpair mo, BasicConfig.MGRef mg, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.AlreadyDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void basic_unlock_MO (BasicConfig.MOidpair mo, BasicConfig.MGRef mg, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  boolean basic_is_locked_MO (BasicConfig.MOidpair mo, BasicConfig.MGRef mg, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /**
       * Methods on a MO
       */
  BasicConfig.MOInfo basic_get_MO_info (BasicConfig.MOidpair mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.MORef basic_get_MO_parent (BasicConfig.MOidpair mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void basic_get_MO_attributes (BasicConfig.MOidpair mo, String[] attributeNames, BasicConfig.NameValueSeqHolder attributes, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void basic_set_MO_attributes (BasicConfig.MOidpair mo, BasicConfig.NameValue[] attributes, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  org.omg.CORBA.Any action (BasicConfig.MOidpair mo, String name, BasicConfig.NameValueSeqHolder parameters, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.ManagedObject convert_MO (BasicConfig.MOidpair mo) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  BasicConfig.ManagedObject[] convert_MOs (BasicConfig.MOidpair[] mos) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /**
       * Methods for the iterator.
       */
  boolean next_MO (BasicConfig.IterRef iterator, BasicConfig.MORefHolder mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  boolean next_MOs (BasicConfig.IterRef iterator, int howMany, BasicConfig.MORefSeqHolder mos, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  boolean all_MOs (BasicConfig.IterRef iterator, BasicConfig.MORefSeqHolder mos, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void delete_Iter (BasicConfig.IterRef iterator, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /**
       * Methods for the extended iterator.
       */
  boolean ext_next_MO (BasicConfig.ExtIterRef iterator, BasicConfig.ExtMORefHolder mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  boolean ext_next_MOs (BasicConfig.ExtIterRef iterator, int howMany, BasicConfig.ExtMORefSeqHolder mos, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  boolean ext_all_MOs (BasicConfig.ExtIterRef iterator, BasicConfig.ExtMORefSeqHolder mos, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void ext_delete_Iter (BasicConfig.ExtIterRef iterator, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /**
       * Methods for the attribute iterator.
       */
  boolean attr_next_MO (BasicConfig.AttrIterRef iterator, BasicConfig.AttrMORefHolder mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  boolean attr_next_MOs (BasicConfig.AttrIterRef iterator, int howMany, BasicConfig.AttrMORefSeqHolder mos, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  boolean attr_all_MOs (BasicConfig.AttrIterRef iterator, BasicConfig.AttrMORefSeqHolder mos, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void attr_delete_Iter (BasicConfig.AttrIterRef iterator, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /**
       * QoS
       */
  short[] get_QoS (BasicConfig.Session session);
  short[] set_QoS (short[] newQoS, BasicConfig.Session session) throws BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  short[] supported_QoS (BasicConfig.Session session) throws BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /**
       * Hoppers and Soft Links
       */
  void create_hopper (BasicConfig.MOidpair sourceMO, CosNaming.NameComponent[] targetMO, String targetMIB, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.AlreadyDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void delete_hopper (BasicConfig.MOidpair sourceMO, BasicConfig.MOidpair targetMO, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void create_association_hopper (BasicConfig.MOidpair sourceMO, CosNaming.NameComponent[] targetMO, String targetMIB, String roleName, String relName, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.AlreadyDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void delete_association_hopper (BasicConfig.MOidpair sourceMO, BasicConfig.MOidpair targetMO, String roleName, String relName, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void create_softlink (BasicConfig.MOidpair sourceMO, CosNaming.NameComponent[] targetMO, String targetMIB, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.AlreadyDefined, BasicConfig.NotAccepted, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
  void delete_softlink (BasicConfig.MOidpair sourceMO, BasicConfig.MOidpair targetMO, BasicConfig.Session session) throws BasicConfig.UnsupportedQoS, BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;
} // interface BasicConfigurationOperations
