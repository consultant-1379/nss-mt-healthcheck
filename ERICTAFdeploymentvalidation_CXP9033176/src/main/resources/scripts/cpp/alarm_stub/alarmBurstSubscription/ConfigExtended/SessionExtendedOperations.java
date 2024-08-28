package ConfigExtended;


/**
* ConfigExtended/SessionExtendedOperations.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_ext_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/

public interface SessionExtendedOperations  extends BasicConfig.SessionOperations
{

  /** Operation: get_CS_session_interface_version
         *  Documentation:
         *      Returns a list of all supported CS Session interface versions
         *
         *      Parameters:
         *      (return): A list of all CS Session interface versions supported by
         *      this implementation.
         *
         */
  String[] get_CS_session_interface_version ();
  int get_maximum_transaction_size () throws BasicConfig.TransactionFailure;
  int get_transaction_size () throws BasicConfig.TransactionFailure;
  int get_transaction_id () throws BasicConfig.TransactionFailure;
} // interface SessionExtendedOperations
