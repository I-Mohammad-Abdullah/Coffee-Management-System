/**
 * CashonDelivery.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package main;

public interface CashonDelivery extends java.rmi.Remote {
    public void delivery(int orderId, java.lang.String status) throws java.rmi.RemoteException;
    public boolean isOrderIdExists(int orderId) throws java.rmi.RemoteException;
}
