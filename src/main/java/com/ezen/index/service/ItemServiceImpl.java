package com.ezen.index.service;

import com.ezen.index.dao.ItemDao;
import com.ezen.index.dao.JdbcItemDao;
import com.ezen.index.dto.Category;
import com.ezen.index.dto.Item;

import java.sql.SQLException;
import java.util.List;

public class ItemServiceImpl implements ItemService {

    ItemDao itemDao = new JdbcItemDao();

    @Override
    public List<Category> categoryList() {
        try {
            return itemDao.findByCategoryAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 전체 상품 리스트 반혼
     *
     * @return
     */
    @Override
    public List<Item> itemList() {
        try {
            return itemDao.findByAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 더비 상품 리스트 반환
     *
     * @return
     */
    @Override
    public List<Item> derbyList() {
        try {
            return itemDao.findByDerby();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 스니커즈 리스트 반환
     *
     * @return
     */
    @Override
    public List<Item> sneakersList() {
        try {
            return itemDao.findBySneakers();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 로퍼 리스트 반환
     *
     * @return
     */
    @Override
    public List<Item> loaferList() {
        try {
            return itemDao.findByLoafer();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Item itemDetail(int categoryNumber, int itemNumber) {
        try {
            return itemDao.itemDetail(categoryNumber, itemNumber);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
