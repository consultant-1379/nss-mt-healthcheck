package ConfigExtended;


/**
* ConfigExtended/ConfigurationExtendedOperations.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_G.idl
* Friday, June 1, 2018 12:05:52 PM GMT+01:00
*/

public interface ConfigurationExtendedOperations  extends BasicConfig.BasicConfigurationOperations
{
  ConfigExtended.NotificationProducer get_notification_producer ();

  /** Operation: get_root_MO
         *  Documentation:
         *      Returns root MO of the MIB.
         *
         *      Parameters:
         *      (in) session: A session object containing the
         *      current transaction.
         *      (return): The MOInfo of the root node.
         */
  ConfigExtended.MOInfo get_root_MO (BasicConfig.Session session) throws BasicConfig.ProcessingFailure, BasicConfig.SecurityViolation, BasicConfig.NotDefined;

  /** Operation: get_MO_parent
         *  Documentation:
         *      Returns MOInfo for the parent MO.
         *
         *      Parameters:
         *      (in) mo: The distinguished name of the MO whose
         *      parent MOInfo should be retrieved from.
         *      It is possible to use either full or local
         *      distinguished name.
         *      (in) session: A session object containing the
         *      current transaction.
         *      (return): The parent's MOInfo.
         */
  ConfigExtended.MOInfo get_MO_parent (String mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /** Operation: get_MO_info_by_name
         *  Documentation:
         *      Used to retrieve MOInfo from one MO by specifying
         *      distinguished name.
         *
         *      Parameters:
         *      (in) mo: The distinguished name of the MO to retrieve
         *      MOInfo from. It is possible to use either full or
         *      local distinguished name.
         *      (in) session: A session object containing the
         *      current transaction.
         *      (return): The MOInfo.
         */
  ConfigExtended.MOInfo get_MO_info_by_name (String mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /** Operation: get_MO_info_by_id
         *  Documentation:
         *      Used to retrieve MOInfo from one MO by specifying
         *      the MO identity (number).
         *
         *      Parameters:
         *      (in) mo: The identity of the MO to retrieve MOInfo
         *      from. The identity is the same as the identity carried
         *      in a BasicConfig::MORef.
         *      (in) session: A session object containing the
         *      current transaction.
         *      (return): The MOInfo.
         */
  ConfigExtended.MOInfo get_MO_info_by_id (long mo, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /** Operation: get_MO_containment
         *  Documentation:
         *      Used to retrieve MOInfo from several MOs by using
         *      scope & filter.
         *
         *      Parameters:
         *      (in) baseMO: The base MO in the MIB from where the
         *      actor wants to retrieve MO information. It is possible
         *      to use either full or local distinguished name.
         *      (in) scope: The number of levels below the base MO
         *      that is retrieved. Set to SCOPE_ALL_LEVELS (-1) to
         *      get the complete subtree.
         *      (in) filter: A constraint for selecting specific MOs.
         *      It is the same filter as specified in BasicConfig.
         *      (in) session: A session object containing the
         *      current transaction.
         *      (return): An MOInfo iterator containing all
         *      MOInfo from the matching MOs.
         */
  int get_MO_containment (String baseMO, int scope, BasicConfig.Filter filter, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /** Operation: next_MO_info
         *  Documentation:
         *      Used to iterate through the MOInfo objects returned
         *      by the get_MO_containment method.
         *
         *      Parameters:
         *      (in) iterator: The iterator to retrieve MOInfo from.
         *      (in) howMany: Specifies the number of MOInfo objects
         *      that should be returned.
         *      (in) session: A session object containing the
         *      current transaction.
         *      (out) mos: An array containing the MOInfo.
         *      (return): Returns true if the iterator contains more
         *      MOInfo objects. If the Iterator is empty, false is
         *      returned and the iterator is deleted.
         */
  boolean next_MO_info (int iterator, int howMany, BasicConfig.Session session, ConfigExtended.MOInfoSeqHolder mos) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /** Operation: delete_MO_info_iter
         *  Documentation:
         *      Deletes the iterator returned by the
         *      get_MO_containment method.
         *
         *      Parameters:
         *      (in) iterator: The iterator to delete.
         *      (in) session: A session object containing the
         *      current transaction.
         *      (return): Returns true if the iterator contains more
         *      MOInfo objects. If the Iterator is empty, false is
         *      returned and the iterator is deleted.
         */
  void delete_MO_info_iter (int iterator, BasicConfig.Session session) throws BasicConfig.NotDefined, BasicConfig.SecurityViolation, BasicConfig.ProcessingFailure;

  /** Operation: get_MO_attributes
         *  Documentation:
         *      Used to retrieve the attribute values for a number of MOs in
         *      one call.
         *
         *      Parameters:
         *      (in) requestedAttributes: is a sequence of a structure where each
         *      struct contains the FDN of the adressed MO and the names of
         *      the attributes to return.
         *      (in) session: A session object containing the
         *      current transaction.
         *      (return):  The requested attributes are returned with name and
         *      value. Index [n] corresponds to index [n] in the 
         *      requestedAttributes parameter
         */
  ConfigExtended.ReturnedAttributes[] get_MO_attributes (ConfigExtended.RequestedAttributes[] requestedAttributes, BasicConfig.Session session) throws BasicConfig.NotAccepted, BasicConfig.ProcessingFailure;
} // interface ConfigurationExtendedOperations
