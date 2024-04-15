package com.ezen.member.dto;

import java.util.ArrayList;
import java.util.List;

public class Order {
    private String orderId;
    private String orderDate;
    private int orderNum;
    private String totalPrice;
    private String itemName;
    private List<String> itemNames = new ArrayList<>();
    public Order() {}

    public List<String> getItemNames() {
        return itemNames;
    }

    public void setItemNames(List<String> itemNames) {
        this.itemNames = itemNames;
    }
    public void addItemName(String itemName) {
        this.itemNames.add(itemName);
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", orderDate='" + orderDate + '\'' +
                ", orderNum=" + orderNum +
                ", totalPrice='" + totalPrice + '\'' +
                ", itemName='" + itemName + '\'' +
                '}';
    }
}
