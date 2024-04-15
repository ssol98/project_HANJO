package com.ezen.payment.dto;

public class Orders {

    private int orderNumber;
    private String receiverName;
    private String receiverPNumber;
    private String receiverAddress;
    private String receiverDetailAddress;
    private String receiverHp;
    private String deliveryMemo;
    private String regdate;
    private int totalPrice;
    private String userId;

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice)
    {
        this.totalPrice = totalPrice;
    }

    public Orders() {}

    public Orders(int orderNumber, String receiverName, String receiverPNumber, String receiverAddress, String receiverDetailAddress, String receiverHp, String deliveryMemo, String regdate, String userId) {
        this.orderNumber = orderNumber;
        this.receiverName = receiverName;
        this.receiverPNumber = receiverPNumber;
        this.receiverAddress = receiverAddress;
        this.receiverDetailAddress = receiverDetailAddress;
        this.receiverHp = receiverHp;
        this.deliveryMemo = deliveryMemo;
        this.regdate = regdate;
        this.userId = userId;
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverPNumber() {
        return receiverPNumber;
    }

    public void setReceiverPNumber(String receiverPNumber) {
        this.receiverPNumber = receiverPNumber;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getReceiverDetailAddress() {
        return receiverDetailAddress;
    }

    public void setReceiverDetailAddress(String receiverDetailAddress) {
        this.receiverDetailAddress = receiverDetailAddress;
    }

    public String getReceiverHp() {
        return receiverHp;
    }

    public void setReceiverHp(String receiverHp) {
        this.receiverHp = receiverHp;
    }

    public String getDeliveryMemo() {
        return deliveryMemo;
    }

    public void setDeliveryMemo(String deliveryMemo) {
        this.deliveryMemo = deliveryMemo;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderNumber=" + orderNumber +
                ", receiverName='" + receiverName + '\'' +
                ", receiverPNumber='" + receiverPNumber + '\'' +
                ", receiverAddress='" + receiverAddress + '\'' +
                ", receiverDetailAddress='" + receiverDetailAddress + '\'' +
                ", receiverHp='" + receiverHp + '\'' +
                ", deliveryMemo='" + deliveryMemo + '\'' +
                ", regdate='" + regdate + '\'' +
                ", totalPrice=" + totalPrice +
                ", userId='" + userId + '\'' +
                '}';
    }
}
