package com.ezen.payment.dao;

import com.ezen.payment.dto.Orders;

import java.sql.SQLException;
import java.util.List;

public interface OrderDao {

    public void createOrder(String userId, String price) throws SQLException;

    public List<Orders> loadOrder(String userId) throws SQLException;

}
