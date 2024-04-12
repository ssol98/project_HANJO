/**
 * 상품에 관한 DTO
 */

package com.ezen.index.dto;

public class OrderList {

    private int itemNumber;
    private int orderNumber;
    private int listAmount;
    private int listSize;
    private int listPrice;

    public OrderList() {}

    public OrderList(int itemNumber, int orderNumber, int listAmount, int listSize, int listPrice) {
        this.itemNumber = itemNumber;
        this.orderNumber = orderNumber;
        this.listAmount = listAmount;
        this.listSize = listSize;
        this.listPrice = listPrice;
    }

    public int getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(int itemNumber) {
        this.itemNumber = itemNumber;
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public int getListAmount() {
        return listAmount;
    }

    public void setListAmount(int listAmount) {
        this.listAmount = listAmount;
    }

    public int getListSize() {
        return listSize;
    }

    public void setListSize(int listSize) {
        this.listSize = listSize;
    }

    public int getListPrice() {
        return listPrice;
    }

    public void setListPrice(int listPrice) {
        this.listPrice = listPrice;
    }

    @Override
    public String toString() {
        return "OrderList{" +
                "itemNumber=" + itemNumber +
                ", orderNumber=" + orderNumber +
                ", listAmount=" + listAmount +
                ", listSize=" + listSize +
                ", listPrice=" + listPrice +
                '}';
    }
}

