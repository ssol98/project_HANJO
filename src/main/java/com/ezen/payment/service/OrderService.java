package com.ezen.payment.service;

import com.ezen.payment.dto.Orders;

import java.util.List;

public interface OrderService {

    public void createOrder(String userId, String price);

    public List<Orders> loadOrder(String userId);

}
