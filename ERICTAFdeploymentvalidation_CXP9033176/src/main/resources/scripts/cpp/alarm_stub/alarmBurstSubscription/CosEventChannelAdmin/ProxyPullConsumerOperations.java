package CosEventChannelAdmin;


/**
* CosEventChannelAdmin/ProxyPullConsumerOperations.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from CosEventChannelAdmin.idl
* Wednesday, July 11, 2018 2:25:08 PM GMT+01:00
*/

public interface ProxyPullConsumerOperations  extends CosEventComm.PullConsumerOperations
{
  void connect_pull_supplier (CosEventComm.PullSupplier pull_supplier) throws CosEventChannelAdmin.AlreadyConnected, CosEventChannelAdmin.TypeError;
} // interface ProxyPullConsumerOperations
