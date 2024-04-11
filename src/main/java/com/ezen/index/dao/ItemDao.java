package com.ezen.index.dao;

import com.ezen.index.dto.Category;
import com.ezen.index.dto.Item;

import java.sql.SQLException;
import java.util.List;

public interface ItemDao {

    public List<Item> load(int id) throws SQLException;

    public List<Category> findByCategoryAll() throws SQLException;

    public List<Item> findByAll() throws SQLException;

    public List<Item> findByDerby() throws SQLException; // 전체목록에서 특정 카테고리 신발 리스트만 where cate_num = ? 로 찾아오기

}
