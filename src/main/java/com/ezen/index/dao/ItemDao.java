package com.ezen.index.dao;

import com.ezen.index.dto.Category;
import com.ezen.index.dto.Item;

import java.sql.SQLException;
import java.util.List;

public interface ItemDao {


    public List<Category> findByCategoryAll() throws SQLException;

    public List<Item> findByAll() throws SQLException;

    public List<Item> findByDerby() throws SQLException;

    public List<Item> findBySneakers() throws SQLException;

    public List<Item> findByLoafer() throws SQLException;

    public Item itemDetail(int categoryNumber, int itemNumber) throws SQLException;
}
