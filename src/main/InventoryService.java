/**
 * InventoryService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package main;

public interface InventoryService extends javax.xml.rpc.Service {
    public java.lang.String getInventoryAddress();

    public main.Inventory getInventory() throws javax.xml.rpc.ServiceException;

    public main.Inventory getInventory(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
