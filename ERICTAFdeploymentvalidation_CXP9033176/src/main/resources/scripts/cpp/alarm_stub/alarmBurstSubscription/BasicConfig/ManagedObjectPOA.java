package BasicConfig;


/**
* BasicConfig/ManagedObjectPOA.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from configuration_K.idl
* Tuesday, May 22, 2018 12:36:12 PM GMT+01:00
*/


/**
   * Interface for fine grain solution
   */
public abstract class ManagedObjectPOA extends org.omg.PortableServer.Servant
 implements BasicConfig.ManagedObjectOperations, org.omg.CORBA.portable.InvokeHandler
{

  // Constructors

  private static java.util.Hashtable _methods = new java.util.Hashtable ();
  static
  {
    _methods.put ("set", new java.lang.Integer (0));
    _methods.put ("get", new java.lang.Integer (1));
    _methods.put ("get_parent", new java.lang.Integer (2));
    _methods.put ("get_containment", new java.lang.Integer (3));
    _methods.put ("get_association", new java.lang.Integer (4));
    _methods.put ("action", new java.lang.Integer (5));
    _methods.put ("get_info", new java.lang.Integer (6));
    _methods.put ("lock", new java.lang.Integer (7));
    _methods.put ("unlock", new java.lang.Integer (8));
    _methods.put ("is_locked", new java.lang.Integer (9));
  }

  public org.omg.CORBA.portable.OutputStream _invoke (String $method,
                                org.omg.CORBA.portable.InputStream in,
                                org.omg.CORBA.portable.ResponseHandler $rh)
  {
    org.omg.CORBA.portable.OutputStream out = null;
    java.lang.Integer __method = (java.lang.Integer)_methods.get ($method);
    if (__method == null)
      throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);

    switch (__method.intValue ())
    {
       case 0:  // BasicConfig/ManagedObject/set
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           BasicConfig.NameValue attributes[] = BasicConfig.AttributeSeqHelper.read (in);
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           this.set (mo, attributes, session);
           out = $rh.createReply();
         } catch (BasicConfig.NotDefined $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.NotDefinedHelper.write (out, $ex);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       case 1:  // BasicConfig/ManagedObject/get
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           String attributeNames[] = BasicConfig.AttributeNameSeqHelper.read (in);
           BasicConfig.NameValueSeqHolder attributes = new BasicConfig.NameValueSeqHolder ();
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           this.get (mo, attributeNames, attributes, session);
           out = $rh.createReply();
           BasicConfig.AttributeSeqHelper.write (out, attributes.value);
         } catch (BasicConfig.NotDefined $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.NotDefinedHelper.write (out, $ex);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       case 2:  // BasicConfig/ManagedObject/get_parent
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           BasicConfig.MOidpair $result = null;
           $result = this.get_parent (mo, session);
           out = $rh.createReply();
           BasicConfig.MOidpairHelper.write (out, $result);
         } catch (BasicConfig.NotDefined $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.NotDefinedHelper.write (out, $ex);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       case 3:  // BasicConfig/ManagedObject/get_containment
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           int scope = BasicConfig.ScopeHelper.read (in);
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           BasicConfig.MOidpair $result[] = null;
           $result = this.get_containment (mo, scope, session);
           out = $rh.createReply();
           BasicConfig.MOidpairSeqHelper.write (out, $result);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       case 4:  // BasicConfig/ManagedObject/get_association
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           String roleName = in.read_string ();
           int scope = BasicConfig.ScopeHelper.read (in);
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           BasicConfig.MOidpair $result[] = null;
           $result = this.get_association (mo, roleName, scope, session);
           out = $rh.createReply();
           BasicConfig.MOidpairSeqHelper.write (out, $result);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       case 5:  // BasicConfig/ManagedObject/action
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           String name = BasicConfig.ActionNameHelper.read (in);
           BasicConfig.NameValueSeqHolder parameters = new BasicConfig.NameValueSeqHolder ();
           parameters.value = BasicConfig.ParameterSeqHelper.read (in);
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           org.omg.CORBA.Any $result = null;
           $result = this.action (mo, name, parameters, session);
           out = $rh.createReply();
           out.write_any ($result);
           BasicConfig.ParameterSeqHelper.write (out, parameters.value);
         } catch (BasicConfig.UnsupportedQoS $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.UnsupportedQoSHelper.write (out, $ex);
         } catch (BasicConfig.NotDefined $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.NotDefinedHelper.write (out, $ex);
         } catch (BasicConfig.NotAccepted $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.NotAcceptedHelper.write (out, $ex);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       case 6:  // BasicConfig/ManagedObject/get_info
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           BasicConfig.MOInfo $result = null;
           $result = this.get_info (mo, session);
           out = $rh.createReply();
           BasicConfig.MOInfoHelper.write (out, $result);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       case 7:  // BasicConfig/ManagedObject/lock
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           this.lock (mo, session);
           out = $rh.createReply();
         } catch (BasicConfig.NotDefined $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.NotDefinedHelper.write (out, $ex);
         } catch (BasicConfig.AlreadyDefined $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.AlreadyDefinedHelper.write (out, $ex);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       case 8:  // BasicConfig/ManagedObject/unlock
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           this.unlock (mo, session);
           out = $rh.createReply();
         } catch (BasicConfig.NotDefined $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.NotDefinedHelper.write (out, $ex);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       case 9:  // BasicConfig/ManagedObject/is_locked
       {
         try {
           CosNaming.NameComponent mo[] = BasicConfig.DNameHelper.read (in);
           BasicConfig.Session session = BasicConfig.SessionHelper.read (in);
           boolean $result = false;
           $result = this.is_locked (mo, session);
           out = $rh.createReply();
           out.write_boolean ($result);
         } catch (BasicConfig.NotDefined $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.NotDefinedHelper.write (out, $ex);
         } catch (BasicConfig.SecurityViolation $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.SecurityViolationHelper.write (out, $ex);
         } catch (BasicConfig.ProcessingFailure $ex) {
           out = $rh.createExceptionReply ();
           BasicConfig.ProcessingFailureHelper.write (out, $ex);
         }
         break;
       }

       default:
         throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);
    }

    return out;
  } // _invoke

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:BasicConfig/ManagedObject:1.0"};

  public String[] _all_interfaces (org.omg.PortableServer.POA poa, byte[] objectId)
  {
    return (String[])__ids.clone ();
  }

  public ManagedObject _this() 
  {
    return ManagedObjectHelper.narrow(
    super._this_object());
  }

  public ManagedObject _this(org.omg.CORBA.ORB orb) 
  {
    return ManagedObjectHelper.narrow(
    super._this_object(orb));
  }


} // class ManagedObjectPOA
