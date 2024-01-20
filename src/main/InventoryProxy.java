package main;

public class InventoryProxy implements main.Inventory {
  private String _endpoint = null;
  private main.Inventory inventory = null;
  
  public InventoryProxy() {
    _initInventoryProxy();
  }
  
  public InventoryProxy(String endpoint) {
    _endpoint = endpoint;
    _initInventoryProxy();
  }
  
  private void _initInventoryProxy() {
    try {
      inventory = (new main.InventoryServiceLocator()).getInventory();
      if (inventory != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)inventory)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)inventory)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (inventory != null)
      ((javax.xml.rpc.Stub)inventory)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public main.Inventory getInventory() {
    if (inventory == null)
      _initInventoryProxy();
    return inventory;
  }
  
  public void deleteCoffeeBean(java.lang.String beanType) throws java.rmi.RemoteException{
    if (inventory == null)
      _initInventoryProxy();
    inventory.deleteCoffeeBean(beanType);
  }
  
  public void updateCoffeeBeanQuantity(java.lang.String beanType, int newQuantity) throws java.rmi.RemoteException{
    if (inventory == null)
      _initInventoryProxy();
    inventory.updateCoffeeBeanQuantity(beanType, newQuantity);
  }
  
  public void insertCoffeeBean(java.lang.String beanType, int smallCupPrice, int mediumCupPrice, int largeCupPrice, int quantity) throws java.rmi.RemoteException{
    if (inventory == null)
      _initInventoryProxy();
    inventory.insertCoffeeBean(beanType, smallCupPrice, mediumCupPrice, largeCupPrice, quantity);
  }
  
  
}