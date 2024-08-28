package CelloNotificationIRPExtension;


/**
* CelloNotificationIRPExtension/_NotificationIRPExtensionStub.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CelloNotificationIRPExtension_F.idl
* Wednesday, July 11, 2018 2:25:07 PM GMT+01:00
*/


/*
   * This interface extends the Notification IRP with Cello 
   * specific support for filters on subscriptions.
   *
   */
public class _NotificationIRPExtensionStub extends org.omg.CORBA.portable.ObjectImpl implements CelloNotificationIRPExtension.NotificationIRPExtension
{


  /*
       * Establishes a subscription based on a filter.
       * Alarm and event notifications will be sent to specified object.
       *
       */
  public String attach_push_ext (org.omg.CORBA.Object manager_reference, int time_tick, String[] notification_category_set, CelloNotificationIRPExtension.Filter filter) throws CelloNotificationIRPExtension.AttachPushExt, NotificationIRPSystem.InvalidParameter, NotificationIRPSystem.AlreadySubscribed, NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupported
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("attach_push_ext", true);
                org.omg.CORBA.ObjectHelper.write ($out, manager_reference);
                $out.write_long (time_tick);
                NotificationIRPConstDefs.NotificationCategorySetHelper.write ($out, notification_category_set);
                CelloNotificationIRPExtension.FilterHelper.write ($out, filter);
                $in = _invoke ($out);
                String $result = NotificationIRPConstDefs.SubscriptionIdHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CelloNotificationIRPExtension/AttachPushExt:1.0"))
                    throw CelloNotificationIRPExtension.AttachPushExtHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/AlreadySubscribed:1.0"))
                    throw NotificationIRPSystem.AlreadySubscribedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/AtLeastOneNotificationCategoryNotSupported:1.0"))
                    throw NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupportedHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return attach_push_ext (manager_reference, time_tick, notification_category_set, filter        );
            } finally {
                _releaseReply ($in);
            }
  } // attach_push_ext


  /*
       * Returns status information for the specified subscription.
       *
       */
  public String[] get_subscription_status_ext (String subscription_id, CelloNotificationIRPExtension.FilterHolder filter_in_effect, NotificationIRPConstDefs.SubscriptionStateHolder subscription_state, org.omg.CORBA.IntHolder time_tick) throws CelloNotificationIRPExtension.GetSubscriptionStatusExt, NotificationIRPSystem.InvalidParameter
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("get_subscription_status_ext", true);
                $out.write_string (subscription_id);
                $in = _invoke ($out);
                String $result[] = NotificationIRPConstDefs.NotificationCategorySetHelper.read ($in);
                filter_in_effect.value = CelloNotificationIRPExtension.FilterHelper.read ($in);
                subscription_state.value = NotificationIRPConstDefs.SubscriptionStateHelper.read ($in);
                time_tick.value = $in.read_long ();
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CelloNotificationIRPExtension/GetSubscriptionStatusExt:1.0"))
                    throw CelloNotificationIRPExtension.GetSubscriptionStatusExtHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return get_subscription_status_ext (subscription_id, filter_in_effect, subscription_state, time_tick        );
            } finally {
                _releaseReply ($in);
            }
  } // get_subscription_status_ext


  /*
       * Changes the filter attached to the specified subscription.
       *
       */
  public void change_subscription_filter_ext (String subscription_id, CelloNotificationIRPExtension.Filter filter) throws CelloNotificationIRPExtension.ChangeSubscriptionFilterExt, NotificationIRPSystem.InvalidParameter
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("change_subscription_filter_ext", true);
                $out.write_string (subscription_id);
                CelloNotificationIRPExtension.FilterHelper.write ($out, filter);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:CelloNotificationIRPExtension/ChangeSubscriptionFilterExt:1.0"))
                    throw CelloNotificationIRPExtension.ChangeSubscriptionFilterExtHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                change_subscription_filter_ext (subscription_id, filter        );
            } finally {
                _releaseReply ($in);
            }
  } // change_subscription_filter_ext


  /* ## Operation: attach_push
      */
  public String attach_push (org.omg.CORBA.Object manager_reference, int time_tick, String[] notification_category_set, String filter) throws NotificationIRPSystem.Attach, NotificationIRPSystem.ParameterNotSupported, NotificationIRPSystem.InvalidParameter, NotificationIRPSystem.AlreadySubscribed, NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupported
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("attach_push", true);
                org.omg.CORBA.ObjectHelper.write ($out, manager_reference);
                $out.write_long (time_tick);
                NotificationIRPConstDefs.NotificationCategorySetHelper.write ($out, notification_category_set);
                $out.write_string (filter);
                $in = _invoke ($out);
                String $result = NotificationIRPConstDefs.SubscriptionIdHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/Attach:1.0"))
                    throw NotificationIRPSystem.AttachHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/ParameterNotSupported:1.0"))
                    throw NotificationIRPSystem.ParameterNotSupportedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/AlreadySubscribed:1.0"))
                    throw NotificationIRPSystem.AlreadySubscribedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/AtLeastOneNotificationCategoryNotSupported:1.0"))
                    throw NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupportedHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return attach_push (manager_reference, time_tick, notification_category_set, filter        );
            } finally {
                _releaseReply ($in);
            }
  } // attach_push


  /* ## Operation: attach_push_b
      */
  public String attach_push_b (org.omg.CORBA.Object manager_reference, int time_tick, String[] notification_category_set, String filter, CosNotifyChannelAdmin.SequenceProxyPushSupplierHolder system_reference) throws NotificationIRPSystem.Attach, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.ParameterNotSupported, NotificationIRPSystem.InvalidParameter, NotificationIRPSystem.AlreadySubscribed, NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupported
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("attach_push_b", true);
                org.omg.CORBA.ObjectHelper.write ($out, manager_reference);
                $out.write_long (time_tick);
                NotificationIRPConstDefs.NotificationCategorySetHelper.write ($out, notification_category_set);
                $out.write_string (filter);
                $in = _invoke ($out);
                String $result = NotificationIRPConstDefs.SubscriptionIdHelper.read ($in);
                system_reference.value = CosNotifyChannelAdmin.SequenceProxyPushSupplierHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/Attach:1.0"))
                    throw NotificationIRPSystem.AttachHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/OperationNotSupported:1.0"))
                    throw NotificationIRPSystem.OperationNotSupportedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/ParameterNotSupported:1.0"))
                    throw NotificationIRPSystem.ParameterNotSupportedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/AlreadySubscribed:1.0"))
                    throw NotificationIRPSystem.AlreadySubscribedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/AtLeastOneNotificationCategoryNotSupported:1.0"))
                    throw NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupportedHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return attach_push_b (manager_reference, time_tick, notification_category_set, filter, system_reference        );
            } finally {
                _releaseReply ($in);
            }
  } // attach_push_b


  /* ## Operation: attach_pull
      */
  public String attach_pull (org.omg.CORBA.Object manager_reference, int time_tick, String[] notification_category_set, String filter, CosNotifyChannelAdmin.SequenceProxyPullSupplierHolder system_reference) throws NotificationIRPSystem.Attach, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.ParameterNotSupported, NotificationIRPSystem.InvalidParameter, NotificationIRPSystem.AlreadySubscribed, NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupported
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("attach_pull", true);
                org.omg.CORBA.ObjectHelper.write ($out, manager_reference);
                $out.write_long (time_tick);
                NotificationIRPConstDefs.NotificationCategorySetHelper.write ($out, notification_category_set);
                $out.write_string (filter);
                $in = _invoke ($out);
                String $result = NotificationIRPConstDefs.SubscriptionIdHelper.read ($in);
                system_reference.value = CosNotifyChannelAdmin.SequenceProxyPullSupplierHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/Attach:1.0"))
                    throw NotificationIRPSystem.AttachHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/OperationNotSupported:1.0"))
                    throw NotificationIRPSystem.OperationNotSupportedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/ParameterNotSupported:1.0"))
                    throw NotificationIRPSystem.ParameterNotSupportedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/AlreadySubscribed:1.0"))
                    throw NotificationIRPSystem.AlreadySubscribedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/AtLeastOneNotificationCategoryNotSupported:1.0"))
                    throw NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupportedHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return attach_pull (manager_reference, time_tick, notification_category_set, filter, system_reference        );
            } finally {
                _releaseReply ($in);
            }
  } // attach_pull


  /* ## Operation: detach
      */
  public void detach (org.omg.CORBA.Object manager_reference, String subscription_id) throws NotificationIRPSystem.DetachException, NotificationIRPSystem.InvalidParameter
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("detach", true);
                org.omg.CORBA.ObjectHelper.write ($out, manager_reference);
                $out.write_string (subscription_id);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/DetachException:1.0"))
                    throw NotificationIRPSystem.DetachExceptionHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                detach (manager_reference, subscription_id        );
            } finally {
                _releaseReply ($in);
            }
  } // detach


  /* ## Operation: get_notification_IRP_version
      */
  public String[] get_notification_IRP_version () throws NotificationIRPSystem.GetNotificationIRPVersion
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("get_notification_IRP_version", true);
                $in = _invoke ($out);
                String $result[] = CommonIRPConstDefs.VersionNumberSetHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/GetNotificationIRPVersion:1.0"))
                    throw NotificationIRPSystem.GetNotificationIRPVersionHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return get_notification_IRP_version (        );
            } finally {
                _releaseReply ($in);
            }
  } // get_notification_IRP_version


  /* ## Operation: get_subscription_status
      */
  public String[] get_subscription_status (String subscription_id, org.omg.CORBA.StringHolder filter_in_effect, NotificationIRPConstDefs.SubscriptionStateHolder subscription_state, org.omg.CORBA.IntHolder time_tick) throws NotificationIRPSystem.GetSubscriptionStatus, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.InvalidParameter
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("get_subscription_status", true);
                $out.write_string (subscription_id);
                $in = _invoke ($out);
                String $result[] = NotificationIRPConstDefs.NotificationCategorySetHelper.read ($in);
                filter_in_effect.value = $in.read_string ();
                subscription_state.value = NotificationIRPConstDefs.SubscriptionStateHelper.read ($in);
                time_tick.value = $in.read_long ();
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/GetSubscriptionStatus:1.0"))
                    throw NotificationIRPSystem.GetSubscriptionStatusHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/OperationNotSupported:1.0"))
                    throw NotificationIRPSystem.OperationNotSupportedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return get_subscription_status (subscription_id, filter_in_effect, subscription_state, time_tick        );
            } finally {
                _releaseReply ($in);
            }
  } // get_subscription_status


  /* ## Operation: get_subscription_ids
      */
  public String[] get_subscription_ids (org.omg.CORBA.Object manager_reference) throws NotificationIRPSystem.GetSubscriptionIds, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.InvalidParameter
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("get_subscription_ids", true);
                org.omg.CORBA.ObjectHelper.write ($out, manager_reference);
                $in = _invoke ($out);
                String $result[] = NotificationIRPConstDefs.SubscriptionIdSetHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/GetSubscriptionIds:1.0"))
                    throw NotificationIRPSystem.GetSubscriptionIdsHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/OperationNotSupported:1.0"))
                    throw NotificationIRPSystem.OperationNotSupportedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return get_subscription_ids (manager_reference        );
            } finally {
                _releaseReply ($in);
            }
  } // get_subscription_ids


  /* ## Operation: change_subscription_filter
      */
  public void change_subscription_filter (String subscription_id, String filter) throws NotificationIRPSystem.ChangeSubscriptionFilter, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.InvalidParameter
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("change_subscription_filter", true);
                $out.write_string (subscription_id);
                $out.write_string (filter);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/ChangeSubscriptionFilter:1.0"))
                    throw NotificationIRPSystem.ChangeSubscriptionFilterHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/OperationNotSupported:1.0"))
                    throw NotificationIRPSystem.OperationNotSupportedHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/InvalidParameter:1.0"))
                    throw NotificationIRPSystem.InvalidParameterHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                change_subscription_filter (subscription_id, filter        );
            } finally {
                _releaseReply ($in);
            }
  } // change_subscription_filter


  /* ## Operation: get_notification_categories
      */
  public String[] get_notification_categories (NotificationIRPConstDefs.EventTypesSetHolder event_type_list, NotificationIRPConstDefs.ExtendedEventTypesSetHolder extended_event_type_list) throws NotificationIRPSystem.GetNotificationCategories, NotificationIRPSystem.OperationNotSupported
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("get_notification_categories", true);
                $in = _invoke ($out);
                String $result[] = NotificationIRPConstDefs.NotificationCategorySetHelper.read ($in);
                event_type_list.value = NotificationIRPConstDefs.EventTypesSetHelper.read ($in);
                extended_event_type_list.value = NotificationIRPConstDefs.ExtendedEventTypesSetHelper.read ($in);
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/GetNotificationCategories:1.0"))
                    throw NotificationIRPSystem.GetNotificationCategoriesHelper.read ($in);
                else if (_id.equals ("IDL:3gppsa5.org/NotificationIRPSystem/OperationNotSupported:1.0"))
                    throw NotificationIRPSystem.OperationNotSupportedHelper.read ($in);
                else
                    throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return get_notification_categories (event_type_list, extended_event_type_list        );
            } finally {
                _releaseReply ($in);
            }
  } // get_notification_categories

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:CelloNotificationIRPExtension/NotificationIRPExtension:1.0", 
    "IDL:3gppsa5.org/NotificationIRPSystem/NotificationIRPOperations:1.0"};

  public String[] _ids ()
  {
    return (String[])__ids.clone ();
  }

  private void readObject (java.io.ObjectInputStream s) throws java.io.IOException
  {
     String str = s.readUTF ();
     String[] args = null;
     java.util.Properties props = null;
     org.omg.CORBA.Object obj = org.omg.CORBA.ORB.init (args, props).string_to_object (str);
     org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl) obj)._get_delegate ();
     _set_delegate (delegate);
  }

  private void writeObject (java.io.ObjectOutputStream s) throws java.io.IOException
  {
     String[] args = null;
     java.util.Properties props = null;
     String str = org.omg.CORBA.ORB.init (args, props).object_to_string (this);
     s.writeUTF (str);
  }
} // class _NotificationIRPExtensionStub
