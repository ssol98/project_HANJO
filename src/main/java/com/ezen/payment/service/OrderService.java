package com.ezen.payment.service;

import com.ezen.payment.dto.Order;

import java.util.List;

public interface OrderService {

    public void createOrder(Order order, String userId);

}
