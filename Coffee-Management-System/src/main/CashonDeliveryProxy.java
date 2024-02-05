package main;

public class CashonDeliveryProxy implements main.CashonDelivery {
  private String _endpoint = null;
  private main.CashonDelivery cashonDelivery = null;
  
  public CashonDeliveryProxy() {
    _initCashonDeliveryProxy();
  }
  
  public CashonDeliveryProxy(String endpoint) {
    _endpoint = endpoint;
    _initCashonDeliveryProxy();
  }
  
  private void _initCashonDeliveryProxy() {
    try {
      cashonDelivery = (new main.CashonDeliveryServiceLocator()).getCashonDelivery();
      if (cashonDelivery != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)cashonDelivery)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)cashonDelivery)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (cashonDelivery != null)
      ((javax.xml.rpc.Stub)cashonDelivery)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public main.CashonDelivery getCashonDelivery() {
    if (cashonDelivery == null)
      _initCashonDeliveryProxy();
    return cashonDelivery;
  }
  
  public void delivery(int orderId, java.lang.String status) throws java.rmi.RemoteException{
    if (cashonDelivery == null)
      _initCashonDeliveryProxy();
    cashonDelivery.delivery(orderId, status);
  }
  
  public boolean isOrderIdExists(int orderId) throws java.rmi.RemoteException{
    if (cashonDelivery == null)
      _initCashonDeliveryProxy();
    return cashonDelivery.isOrderIdExists(orderId);
  }
  
  
}