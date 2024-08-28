package NotificationIRPSystem;


/**
* NotificationIRPSystem/NotificationIRPOperationsOperations.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from NotificationIRPSystem_F.idl
* Wednesday, July 11, 2018 2:25:15 PM GMT+01:00
*/

public interface NotificationIRPOperationsOperations 
{

  /* ## Operation: attach_push
      */
  String attach_push (org.omg.CORBA.Object manager_reference, int time_tick, String[] notification_category_set, String filter) throws NotificationIRPSystem.Attach, NotificationIRPSystem.ParameterNotSupported, NotificationIRPSystem.InvalidParameter, NotificationIRPSystem.AlreadySubscribed, NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupported;

  /* ## Operation: attach_push_b
      */
  String attach_push_b (org.omg.CORBA.Object manager_reference, int time_tick, String[] notification_category_set, String filter, CosNotifyChannelAdmin.SequenceProxyPushSupplierHolder system_reference) throws NotificationIRPSystem.Attach, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.ParameterNotSupported, NotificationIRPSystem.InvalidParameter, NotificationIRPSystem.AlreadySubscribed, NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupported;

  /* ## Operation: attach_pull
      */
  String attach_pull (org.omg.CORBA.Object manager_reference, int time_tick, String[] notification_category_set, String filter, CosNotifyChannelAdmin.SequenceProxyPullSupplierHolder system_reference) throws NotificationIRPSystem.Attach, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.ParameterNotSupported, NotificationIRPSystem.InvalidParameter, NotificationIRPSystem.AlreadySubscribed, NotificationIRPSystem.AtLeastOneNotificationCategoryNotSupported;

  /* ## Operation: detach
      */
  void detach (org.omg.CORBA.Object manager_reference, String subscription_id) throws NotificationIRPSystem.DetachException, NotificationIRPSystem.InvalidParameter;

  /* ## Operation: get_notification_IRP_version
      */
  String[] get_notification_IRP_version () throws NotificationIRPSystem.GetNotificationIRPVersion;

  /* ## Operation: get_subscription_status
      */
  String[] get_subscription_status (String subscription_id, org.omg.CORBA.StringHolder filter_in_effect, NotificationIRPConstDefs.SubscriptionStateHolder subscription_state, org.omg.CORBA.IntHolder time_tick) throws NotificationIRPSystem.GetSubscriptionStatus, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.InvalidParameter;

  /* ## Operation: get_subscription_ids
      */
  String[] get_subscription_ids (org.omg.CORBA.Object manager_reference) throws NotificationIRPSystem.GetSubscriptionIds, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.InvalidParameter;

  /* ## Operation: change_subscription_filter
      */
  void change_subscription_filter (String subscription_id, String filter) throws NotificationIRPSystem.ChangeSubscriptionFilter, NotificationIRPSystem.OperationNotSupported, NotificationIRPSystem.InvalidParameter;

  /* ## Operation: get_notification_categories
      */
  String[] get_notification_categories (NotificationIRPConstDefs.EventTypesSetHolder event_type_list, NotificationIRPConstDefs.ExtendedEventTypesSetHolder extended_event_type_list) throws NotificationIRPSystem.GetNotificationCategories, NotificationIRPSystem.OperationNotSupported;
} // interface NotificationIRPOperationsOperations
