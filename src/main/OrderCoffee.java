/**
 * OrderCoffee.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package main;

public interface OrderCoffee extends java.rmi.Remote {
    public void coffee(int cupSizeID, int beantypeID, int quantity, java.lang.String name, java.lang.String email, java.lang.String address) throws java.rmi.RemoteException;
    public int getCupTypeId(java.lang.String cupType) throws java.rmi.RemoteException;
    public int getBeanTypeId(java.lang.String beanType) throws java.rmi.RemoteException;
    public boolean checkQuantityAvailable(int beanTypeID, int requestedQuantity) throws java.rmi.RemoteException;
}
