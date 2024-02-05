package main;

public class CustomerRegisterProxy implements main.CustomerRegister {
  private String _endpoint = null;
  private main.CustomerRegister customerRegister = null;
  
  public CustomerRegisterProxy() {
    _initCustomerRegisterProxy();
  }
  
  public CustomerRegisterProxy(String endpoint) {
    _endpoint = endpoint;
    _initCustomerRegisterProxy();
  }
  
  private void _initCustomerRegisterProxy() {
    try {
      customerRegister = (new main.CustomerRegisterServiceLocator()).getCustomerRegister();
      if (customerRegister != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)customerRegister)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)customerRegister)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (customerRegister != null)
      ((javax.xml.rpc.Stub)customerRegister)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public main.CustomerRegister getCustomerRegister() {
    if (customerRegister == null)
      _initCustomerRegisterProxy();
    return customerRegister;
  }
  
  public void registeration(java.lang.String name, java.lang.String email, java.lang.String address) throws java.rmi.RemoteException{
    if (customerRegister == null)
      _initCustomerRegisterProxy();
    customerRegister.registeration(name, email, address);
  }
  
  
}