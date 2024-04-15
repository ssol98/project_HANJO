package com.ezen.payment.service;

import com.ezen.payment.dao.JdbcOrderDao;
import com.ezen.payment.dao.OrderDao;
import com.ezen.payment.dto.Orders;

import java.sql.SQLException;
import java.util.List;

public class OrderServiceImpl implements OrderService{

    OrderDao orderDao = new JdbcOrderDao();


    /**
     * 주문 항목 생성
     */
    @Override
    public void createOrder(String userId, String price) {
        try {
            orderDao.createOrder(userId, price);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Orders> loadOrder(String userId) {
        try {
            return orderDao.loadOrder(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
