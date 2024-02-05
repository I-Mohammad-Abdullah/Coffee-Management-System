/**
 * Inventory.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package main;

public interface Inventory extends java.rmi.Remote {
    public void insertCoffeeBean(java.lang.String beanType, int smallCupPrice, int mediumCupPrice, int largeCupPrice, int quantity) throws java.rmi.RemoteException;
    public void deleteCoffeeBean(java.lang.String beanType) throws java.rmi.RemoteException;
    public void updateCoffeeBeanQuantity(java.lang.String beanType, int newQuantity) throws java.rmi.RemoteException;
}
