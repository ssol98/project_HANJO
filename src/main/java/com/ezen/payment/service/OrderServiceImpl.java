package com.ezen.payment.service;

import com.ezen.payment.dao.JdbcOrderDao;
import com.ezen.payment.dao.OrderDao;
import com.ezen.payment.dto.Order;

import java.sql.SQLException;

public class OrderServiceImpl implements OrderService{

    OrderDao orderDao = new JdbcOrderDao();


    /**
     * 주문 항목 생성
     * @param order
     */
    @Override
    public void createOrder(Order order, String userId) {
        try {
            orderDao.createOrder(order, userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
