package com.ezen.member.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ezen.member.dto.Member;
import com.ezen.member.dto.Order;

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

    /**
     * 사용자의 주문정보를 중복된 주문번호일 시 같은 맵으로 묶어 객체에 저장하기 위한 쿼리문
     * @param id
     * @return
     * @throws SQLException
     */
    @Override
    public List<Order> orderList(String id) throws SQLException {

        Map<Integer, Order> orderMap = new HashMap<>(); // 주문 번호를 키로 하여 Order 객체를 저장

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT orders.user_id AS order_id, orders.order_date, orders.order_num, orders.total_price, item.item_name")
                .append(" FROM orders")
                .append(" JOIN order_list ON orders.order_num = order_list.order_num")
                .append(" JOIN item ON order_list.item_num = item.item_num")
                .append(" WHERE orders.user_id = ?");

        try (Connection con = connectionFactory.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int orderNum = rs.getInt("order_num");
                    Order order = orderMap.getOrDefault(orderNum, null); //orderNum의 값이나 default값을 가져와
                    if (order == null) {
                        order = new Order(); // 새로운 주문 번호인 경우에 새롭게 추가되는 객체생성 (초기화)
                        order.setOrderId(rs.getString("order_id"));
                        order.setOrderDate(rs.getString("order_date"));
                        order.setOrderNum(orderNum);
                        order.setTotalPrice(rs.getString("total_price"));
                        orderMap.put(orderNum, order);
                    }
                    order.addItemName(rs.getString("item_name")); // 상품 이름 추가
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return new ArrayList<>(orderMap.values()); // Map의 값을 리스트로 변환하여 반환

        /**
         * 밑의 로직은 모든 항목을 리스트로 뽑아 낼때 사용할 수 있습니다 (나중에 사용할 가능성때문에 주석)
         * ex) 주문번호- 24의 브라운 스니커즈 주문총가격 (항목으로 사용할거면 아이템 가격으로 변경) 주문일시
         *     주문번호- 24의 베이지 스니커드 주문총가격 (,,) 주문일시
         */
//        List<Order> orders = new ArrayList<>();
//
//        StringBuilder sql = new StringBuilder();
//        sql.append(" SELECT orders.user_id AS order_id, orders.order_date, orders.order_num, orders.total_price, item.item_name")
//                .append(" FROM orders")
//                .append(" JOIN order_list ON orders.order_num = order_list.order_num")
//                .append(" JOIN item ON order_list.item_num = item.item_num")
//                .append(" WHERE orders.user_id = ?");
//
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//
//        try {
//            con = connectionFactory.getConnection();
//            pstmt = con.prepareStatement(sql.toString());
//            pstmt.setString(1, id);
//            rs = pstmt.executeQuery();
//
//
//            while (rs.next()) {
//                Order order = new Order();
//                order.setOrderId(rs.getString("order_id"));
//                order.setOrderDate(rs.getString("order_date"));
//                order.setOrderNum(rs.getInt("order_num"));
//                order.setTotalPrice(rs.getString("total_price"));
//                order.setItemName(rs.getString("item_name"));
//                orders.add(order); // 배열에 추가
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        } finally {
//            try {
//                if (rs != null) rs.close();
//                if (pstmt != null) pstmt.close();
//                if (con != null) con.close();
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//        }
//        return orders;
    }

    /**
     * 테스트출력을 위한 메인
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception {

        MemberDao memberDao = new JdbcMemberDao();
        String userId = "hanzo1"; // 조회하고자 하는 사용자 ID 입력

        try {
            List<Order> orders = memberDao.orderList(userId);
            for (Order order : orders) {
//                System.out.println("주문 번호: " + order.getOrderNum());
//                System.out.println("주문 날짜: " + order.getOrderDate());
//                System.out.println("총 가격: " + order.getTotalPrice());
//                System.out.println("주문 상품: " + String.join(", ", order.getItemNames()));
//                System.out.println("------------------------------");
            }
        } catch (SQLException e) {
            System.err.println("데이터베이스 조회 중 에러 발생: " + e.getMessage());
        }
    }


}
