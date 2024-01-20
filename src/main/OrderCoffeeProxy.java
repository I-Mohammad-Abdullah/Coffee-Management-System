package main;

public class OrderCoffeeProxy implements main.OrderCoffee {
  private String _endpoint = null;
  private main.OrderCoffee orderCoffee = null;
  
  public OrderCoffeeProxy() {
    _initOrderCoffeeProxy();
  }
  
  public OrderCoffeeProxy(String endpoint) {
    _endpoint = endpoint;
    _initOrderCoffeeProxy();
  }
  
  private void _initOrderCoffeeProxy() {
    try {
      orderCoffee = (new main.OrderCoffeeServiceLocator()).getOrderCoffee();
      if (orderCoffee != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)orderCoffee)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)orderCoffee)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (orderCoffee != null)
      ((javax.xml.rpc.Stub)orderCoffee)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public main.OrderCoffee getOrderCoffee() {
    if (orderCoffee == null)
      _initOrderCoffeeProxy();
    return orderCoffee;
  }
  
  public void coffee(int cupSizeID, int beantypeID, int quantity, java.lang.String name, java.lang.String email, java.lang.String address) throws java.rmi.RemoteException{
    if (orderCoffee == null)
      _initOrderCoffeeProxy();
    orderCoffee.coffee(cupSizeID, beantypeID, quantity, name, email, address);
  }
  
  public int getCupTypeId(java.lang.String cupType) throws java.rmi.RemoteException{
    if (orderCoffee == null)
      _initOrderCoffeeProxy();
    return orderCoffee.getCupTypeId(cupType);
  }
  
  public int getBeanTypeId(java.lang.String beanType) throws java.rmi.RemoteException{
    if (orderCoffee == null)
      _initOrderCoffeeProxy();
    return orderCoffee.getBeanTypeId(beanType);
  }
  
  public boolean checkQuantityAvailable(int beanTypeID, int requestedQuantity) throws java.rmi.RemoteException{
    if (orderCoffee == null)
      _initOrderCoffeeProxy();
    return orderCoffee.checkQuantityAvailable(beanTypeID, requestedQuantity);
  }
  
  
}