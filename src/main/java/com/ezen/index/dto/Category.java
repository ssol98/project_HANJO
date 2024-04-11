package com.ezen.index.dto;

public class Category {

    private int categoryNumber;
    // 10 : 스니커즈 , 20 : 더비, 30 : 로퍼

    private String categoryName;
    private String categoryInfo;

    public Category() {}

    public Category(int categoryNumber, String categoryName, String categoryInfo) {
        this.categoryNumber = categoryNumber;
        this.categoryName = categoryName;
        this.categoryInfo = categoryInfo;
    }

    public int getCategoryNumber() {
        return categoryNumber;
    }

    public void setCategoryNumber(int categoryNumber) {
        this.categoryNumber = categoryNumber;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryInfo() {
        return categoryInfo;
    }

    public void setCategoryInfo(String categoryInfo) {
        this.categoryInfo = categoryInfo;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryNumber=" + categoryNumber +
                ", categoryName='" + categoryName + '\'' +
                ", categoryInfo='" + categoryInfo + '\'' +
                '}';
    }
}
