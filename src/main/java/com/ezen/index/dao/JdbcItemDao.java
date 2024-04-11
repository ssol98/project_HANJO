package com.ezen.index.dao;

import com.ezen.index.dto.Category;
import com.ezen.index.dto.Item;
import com.ezen.mall.domain.common.database.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcItemDao implements ItemDao {

    private ConnectionFactory connectionFactory = ConnectionFactory.getInstance();

    @Override
    public List<Item> load(int id) throws SQLException {
        return null;

    }

    /**
     * DB에서 카테고리 관련 정보 가져오기
     * @return
     * @throws SQLException
     */
    @Override
    public List<Category> findByCategoryAll() throws SQLException {

        List<Category> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT CATE_NUM, CATE_NAME, CATE_INFO")
                .append(" FROM CATEGORY")
                .append(" ORDER BY CATE_NUM");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryNumber(rs.getInt("CATE_NUM"));
                category.setCategoryName(rs.getString("CATE_NAME"));
                category.setCategoryInfo(rs.getString("CATE_INFO"));
                list.add(category);
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

    /**
     * DB에서 상품 목록 가져오기
     * @return
     * @throws SQLException
     */
    @Override
    public List<Item> findByAll() throws SQLException {
        List<Item> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT ITEM_NUM, ITEM_NAME, ITEM_PRICE, ITEM_INFO, ITEM_THUMB, ITEM_IMG, CATE_NUM")
                .append(" FROM ITEM");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Item item = new Item();
                item.setItemNumber(rs.getInt("ITEM_NUM"));
                item.setItemName(rs.getString("ITEM_NAME"));
                item.setPrice(rs.getString("ITEM_PRICE"));
                item.setItemInfo(rs.getString("ITEM_INFO"));
                item.setItemThumb(rs.getString("ITEM_THUMB"));
                item.setItemImage(rs.getString("ITEM_IMG"));
                item.setItemCategory(rs.getString("CATE_NUM"));

                list.add(item);
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

    /**
     * 더비 상품 리스트 가져오기
     * @return
     * @throws SQLException
     */
    @Override
    public List<Item> findByDerby() throws SQLException {
        List<Item> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT ITEM_NUM, ITEM_NAME, ITEM_PRICE, ITEM_INFO, ITEM_THUMB, ITEM_IMG, CATE_NUM")
                .append(" FROM ITEM")
                .append(" WHERE CATE_NUM = 20");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Item item = new Item();
                item.setItemNumber(rs.getInt("ITEM_NUM"));
                item.setItemName(rs.getString("ITEM_NAME"));
                item.setPrice(rs.getString("ITEM_PRICE"));
                item.setItemInfo(rs.getString("ITEM_INFO"));
                item.setItemThumb(rs.getString("ITEM_THUMB"));
                item.setItemImage(rs.getString("ITEM_IMG"));
                item.setItemCategory(rs.getString("CATE_NUM"));

                list.add(item);
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

    /**
     * 스니커즈 리스트 가져오기
     * @return
     * @throws SQLException
     */
    @Override
    public List<Item> findBySneakers() throws SQLException {
        List<Item> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT ITEM_NUM, ITEM_NAME, ITEM_PRICE, ITEM_INFO, ITEM_THUMB, ITEM_IMG, CATE_NUM")
                .append(" FROM ITEM")
                .append(" WHERE CATE_NUM = 10");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Item item = new Item();
                item.setItemNumber(rs.getInt("ITEM_NUM"));
                item.setItemName(rs.getString("ITEM_NAME"));
                item.setPrice(rs.getString("ITEM_PRICE"));
                item.setItemInfo(rs.getString("ITEM_INFO"));
                item.setItemThumb(rs.getString("ITEM_THUMB"));
                item.setItemImage(rs.getString("ITEM_IMG"));
                item.setItemCategory(rs.getString("CATE_NUM"));

                list.add(item);
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

    /**
     * 로퍼 리스트 가져오기
     * @return
     * @throws SQLException
     */
    @Override
    public List<Item> findByLoafer() throws SQLException {
        List<Item> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT ITEM_NUM, ITEM_NAME, ITEM_PRICE, ITEM_INFO, ITEM_THUMB, ITEM_IMG, CATE_NUM")
                .append(" FROM ITEM")
                .append(" WHERE CATE_NUM = 30");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Item item = new Item();
                item.setItemNumber(rs.getInt("ITEM_NUM"));
                item.setItemName(rs.getString("ITEM_NAME"));
                item.setPrice(rs.getString("ITEM_PRICE"));
                item.setItemInfo(rs.getString("ITEM_INFO"));
                item.setItemThumb(rs.getString("ITEM_THUMB"));
                item.setItemImage(rs.getString("ITEM_IMG"));
                item.setItemCategory(rs.getString("CATE_NUM"));

                list.add(item);
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

    /*
     * 테스트를 위한 메인 메소드
     */
    public static void main(String[] args) throws SQLException {
        ItemDao itemDao = new JdbcItemDao();
        Category category = new Category();

//        System.out.println(itemDao.findByCategoryAll());  // DB 카테고리 가져오기 (성공)
//        System.out.println(itemDao.findByAll());  // DB 전체 상품리스트 가져오기 (성공)
        System.out.println(itemDao.findByDerby());  // DB 특정 카테고리 리스트 가져오기 (성공)
        System.out.println(itemDao.findBySneakers());  // DB 특정 카테고리 리스트 가져오기 (성공)
        System.out.println(itemDao.findByLoafer());  // DB 특정 카테고리 리스트 가져오기 (성공)

    }
}
