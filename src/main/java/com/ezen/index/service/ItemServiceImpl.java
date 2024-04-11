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

    @Override
    public List<Item> itemList() {
        try {
            return itemDao.findByAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Item> derbyList() {
        try {
            return itemDao.findByDerby();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
