package com.ezen.index.service;

import com.ezen.index.dao.ItemDao;
import com.ezen.index.dao.JdbcItemDao;
import com.ezen.index.dto.Category;
import com.ezen.index.dto.Item;

import java.util.List;

public interface ItemService {

    /**
     * 카테고리 리스트 반환
     * @return
     */
    public List<Category> categoryList();

    /**
     * 전체 상품 리스트 반환
     * @return
     */
    public List<Item> itemList();

    /**
     * 더비 리스트 전체 반환
     * @return
     */
    public List<Item> derbyList();

    /**
     * 스니커즈 리스트 전체 반환
     * @return
     */

    public List<Item> sneakersList();

    /**
     * 로퍼 리스트 전체 반환
     * @return
     */
    public List<Item> loaferList();

    public Item itemDetail(int categoryNumber, int itemNumber);

}
