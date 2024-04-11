/**
 * 상품에 관한 DTO
 */

package com.ezen.index.dto;

public class Item {

    private int itemNumber;
    private String itemName;
    private String price;
    private String itemInfo;
    private String itemThumb;
    private String itemImage;
    private String itemCategory;

    public Item() {}

    public Item(int itemNumber, String itemName, String price, String itemInfo, String itemThumb, String itemImage, String itemCategory) {
        this.itemNumber = itemNumber;
        this.itemName = itemName;
        this.price = price;
        this.itemInfo = itemInfo;
        this.itemThumb = itemThumb;
        this.itemImage = itemImage;
        this.itemCategory = itemCategory;
    }

    public int getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(int itemNumber) {
        this.itemNumber = itemNumber;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getItemInfo() {
        return itemInfo;
    }

    public void setItemInfo(String itemInfo) {
        this.itemInfo = itemInfo;
    }

    public String getItemThumb() {
        return itemThumb;
    }

    public void setItemThumb(String itemThumb) {
        this.itemThumb = itemThumb;
    }

    public String getItemImage() {
        return itemImage;
    }

    public void setItemImage(String itemImage) {
        this.itemImage = itemImage;
    }

    public String getItemCategory() {
        return itemCategory;
    }

    public void setItemCategory(String itemCategory) {
        this.itemCategory = itemCategory;
    }

    @Override
    public String toString() {
        return "Item{" +
                "itemNumber=" + itemNumber +
                ", itemName='" + itemName + '\'' +
                ", price='" + price + '\'' +
                ", itemInfo='" + itemInfo + '\'' +
                ", itemThumb='" + itemThumb + '\'' +
                ", itemImage='" + itemImage + '\'' +
                ", itemCategory='" + itemCategory + '\'' +
                '}';
    }
}

