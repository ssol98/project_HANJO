package com.ezen.payment.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.member.dao.JdbcMemberDao;
import com.ezen.member.dto.Member;
import com.ezen.payment.dto.Orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcOrderDao implements OrderDao {

    private ConnectionFactory connectionFactory = ConnectionFactory.getInstance();

    @Override
    public void createOrder(String userId, String price) throws SQLException {

        JdbcMemberDao jdbcMemberDao = new JdbcMemberDao();
        Member member = jdbcMemberDao.findById(userId); // userId에 관한 정보 값들 가져오기
        String realPrice = price.replaceAll(",","");

        StringBuilder sql = new StringBuilder();

        sql.append(" INSERT INTO ORDERS(ORDER_NUM, RECEIVER_NAME, RECEIVER_PNUM, RECEIVER_ADDRESS, RECEIVER_DETAIL_ADDRESS, RECEIVER_HP, TOTAL_PRICE, USER_ID)")
                .append(" VALUES(order_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
//            conn.setAutoCommit(true); // 기본값: true
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, member.getName());
            pstmt.setString(2, member.getPostNum());
            pstmt.setString(3, member.getDefaultAddress());
            pstmt.setString(4, (member.getDetailAddress()));
            pstmt.setString(5, (member.getPhoneNum()));
            pstmt.setInt(6, Integer.parseInt(realPrice));
            pstmt.setString(7, (member.getId()));
            pstmt.executeUpdate();

        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public List<Orders> loadOrder(String userId) throws SQLException {
        List<Orders> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        sql.append(" SELECT ORDER_NUM, RECEIVER_NAME, TOTAL_PRICE, ORDER_DATE")
                .append(" FROM ORDERS")
                .append(" WHERE USER_ID = ?");

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                order.setOrderNumber(rs.getInt("ORDER_NUM"));
                order.setReceiverName(rs.getString("RECEIVER_NAME"));
                order.setTotalPrice(rs.getInt("TOTAL_PRICE"));
                order.setRegdate(rs.getString("ORDER_DATE"));

                list.add(order);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return list;
    }

    public static void main(String[] args) throws SQLException {
        OrderDao orderDao = new JdbcOrderDao();

//        System.out.println(orderDao.loadOrder("hanzo9997"));
    }
}

