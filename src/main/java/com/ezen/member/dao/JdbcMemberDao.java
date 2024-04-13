package com.ezen.member.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.member.dto.Member;
import com.ezen.member.dto.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 회원 관련 관계형 Database 전담 처리 클래스
 */
public class JdbcMemberDao implements MemberDao {
    private ConnectionFactory connectionFactory;

    public JdbcMemberDao() {
        connectionFactory = ConnectionFactory.getInstance();
    }


    //--------------------------------------------------------------------------

    // 회원 테이블에 회원정보 입력
    public void create(Member member) throws Exception {
        StringBuilder sql = new StringBuilder();
        StringBuilder scoreSql = new StringBuilder();
        sql.append(" INSERT INTO USERS ( user_id, user_passwd, user_email, user_hp, user_name, user_pnum, default_address, detail_address)")
                .append(" VALUES (?, ?, ?, ?, ?, ?, ?, ? )");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getEmail());
            pstmt.setString(4, member.getPhoneNum());
            pstmt.setString(5, member.getName());
            pstmt.setString(6, member.getPostNum());
            pstmt.setString(7, member.getDefaultAddress());
            pstmt.setString(8, member.getDetailAddress());
//            pstmt.setString(9, member.getRegdate());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    // 회원아이디를 전달받아 회원 상세정보를 반환
    public Member findById(String id) throws SQLException {
//        System.out.println("------구분--------");  아이디가 잘 들어왓는지 확인을 위함
//        System.out.println(id);
//        System.out.println("------구분--------");
        Member member = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT user_id, user_passwd, user_email, user_hp, user_name, user_pnum, default_address, detail_address, TO_CHAR(regdate, 'yyyy-MM-DD HH24:MI:SS') regdate")
                .append(" FROM USERS")
                .append(" WHERE user_id = ?");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                member = new Member();
                member.setId(rs.getString("user_id"));
                member.setName(rs.getString("user_name"));
                member.setEmail(rs.getString("user_email"));
                member.setPhoneNum(rs.getString("user_hp"));
                member.setPostNum(rs.getString("user_pnum"));
                member.setDefaultAddress(rs.getString("default_address"));
                member.setDetailAddress(rs.getString("detail_address"));
                member.setRegdate(rs.getString("regdate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
        return member;
    }

    ////-----------------------------------------

    // 회원아이디와 비밀번호 전달받아 인증 결과 반환
    public boolean findByIdNPasswd(String id, String passwd) throws SQLException {
        boolean isMember = false;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT user_id, user_name, user_email")
                .append(" FROM USERS")
                .append(" WHERE user_id = ? AND user_passwd = ?");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            isMember = rs.next();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
//         System.out.println(isMember);
        return isMember;
    }

    @Override
    public List<Member> findByAll() throws SQLException {
        List<Member> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT user_id, user_passwd, user_email, user_hp, user_name, user_pnum, default_address, detail_address")
                .append(" FROM USERS");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Member member = new Member();
                member.setId(rs.getString("user_id"));
                member.setName(rs.getString("user_name"));
                member.setEmail(rs.getString("user_email"));
                member.setPhoneNum(rs.getString("user_hp"));
                member.setPostNum(rs.getString("user_pnum"));
                member.setDefaultAddress(rs.getString("default_address"));
                member.setDetailAddress(rs.getString("detail_address"));
//                member.setRegdate(rs.getString("regdate"));
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;


    }

    @Override
    public Member orderList(String id) throws SQLException {
        Member member = new Member();
        List<Order> orders = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT orders.user_id AS order_id, orders.order_date, orders.order_num, orders.total_price, item.item_name")
                .append(" FROM orders")
                .append(" JOIN order_list ON orders.order_num = order_list.order_num")
                .append(" JOIN item ON order_list.item_num = item.item_num")
                .append(" WHERE orders.user_id = ?");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member.setId(rs.getString("user_id"));
                do { // 루프문으로 멤버객체에 속한 order 배열로 저장
                    Order order = new Order();
                    order.setOrderId(rs.getString("order_id"));
                    order.setOrderDate(rs.getString("order_date"));
                    order.setOrderNum(rs.getInt("order_num"));
                    order.setTotalPrice(rs.getString("total_price"));
                    order.setItemName(rs.getString("item_name"));
                    orders.add(order); // 배열에 추가
                } while (rs.next());
            }
            member.setOrders(orders); // Member 객체에 order 배열 추가
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return member;
    }

    public static void main(String[] args) throws Exception {
        MemberDao memberDao = new JdbcMemberDao();
//        Member member = new Member("monday", "1111", "월요일", "monday@gmail.com","01022571892","서울시중랑구상봉동","블라블라","02122","20240506");
//        memberDao.create(member);
//        System.out.println("회원가입 완료...");
//
//
//        member = memberDao.findById("bangry");
//        //System.out.println(member);
//        boolean isMember = memberDao.findByIdNPasswd("hanzo1", "1111");
//        System.out.println(isMember);
//
//        List<Member> list = memberDao.findByAll();
//        for (Member members : list) {
//            System.out.println(members);
//        }

        Member hanzo = memberDao.orderList("hanzo1");
        System.out.println(hanzo);
    }


}
