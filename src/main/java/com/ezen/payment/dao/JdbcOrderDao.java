package com.ezen.payment.dao;

import com.ezen.board.dto.Board;
import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.payment.dto.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcOrderDao implements OrderDao{

    private ConnectionFactory connectionFactory = ConnectionFactory.getInstance();

    @Override
    public void createOrder(Order order, String userId) throws SQLException {
//        List<Board> list = new ArrayList<>();
//
//        StringBuilder sql = new StringBuilder();
//        sql.append(" SELECT board_id, category, title, description")
//                .append(" FROM board")
//                .append(" ORDER BY board_id");
//
//        Connection conn = connectionFactory.getConnection();
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        try {
//            pstmt = conn.prepareStatement(sql.toString());
//            rs = pstmt.executeQuery();
//            while (rs.next()) {
//                board.setBoardId(rs.getInt("board_id"));
//                board.setCategory(rs.getInt("category"));
//                board.setTitle(rs.getString("title"));
//                board.setDescription(rs.getString("description"));
//                list.add(board);
//            }
//        } finally {
//            try {
//                if (rs != null) rs.close();
//                if (pstmt != null) pstmt.close();
//                if (conn != null) conn.close();
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//        }


//
//
//
//
//
//
//
//
//
//
//
//
//
//
//        sql.append(" INSERT INTO ORDERS(ORDER_NUM, board_id, writer, title, content, passwd, group_no, level_no, order_no)")
//                .append(" VALUES(order_num_seq.NEXTVAL, )");
//        Connection conn = connectionFactory.getConnection();
//        PreparedStatement pstmt = null;
//
//        try {
////            conn.setAutoCommit(true); // 기본값: true
//            pstmt = conn.prepareStatement(sql.toString());
//            pstmt.setInt(1, article.getBoardId());
//            pstmt.setString(2, article.getWriter());
//            pstmt.setString(3, article.getTitle());
//            pstmt.setString(4, article.getContent());
//            pstmt.setString(5, article.getPasswd());
//            pstmt.executeUpdate();
//
//        } finally {
//            try {
//                if (pstmt != null) pstmt.close();
//                if (conn != null) conn.close();
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//        }
    }
}
