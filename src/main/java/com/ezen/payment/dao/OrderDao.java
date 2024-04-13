package com.ezen.payment.dao;

import com.ezen.payment.dto.Order;

import java.sql.SQLException;
import java.util.List;

public interface OrderDao {

    public void createOrder(Order order, String userId) throws SQLException;
}
