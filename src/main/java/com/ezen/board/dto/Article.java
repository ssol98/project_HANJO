package com.ezen.board.dto;

public class Article {
    private int articleNum;
    private String articleTitle;
    private String articleContent;
    private String articleDate;
    private int hitcount;
    private String userId;
    private int boardNum;
    private int countReply;

    public Article(){}

    public Article(int articleNum, String articleTitle, String articleContent, String regdate, int hitcount, String userId, int boardNum, int countReply) {
        this.articleNum = articleNum;
        this.articleTitle = articleTitle;
        this.articleContent = articleContent;
        this.articleDate = regdate;
        this.hitcount = hitcount;
        this.userId = userId;
        this.boardNum = boardNum;
        this.countReply = countReply;
    }

    public int getArticleNum() {
        return articleNum;
    }

    public void setArticleNum(int articleNum) {
        this.articleNum = articleNum;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public String getArticleDate() {
        return articleDate;
    }

    public void setArticleDate(String regdate) {
        this.articleDate = regdate;
    }

    public int getHitcount() {
        return hitcount;
    }

    public void setHitcount(int hitcount) {
        this.hitcount = hitcount;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(int boardNum) {
        this.boardNum = boardNum;
    }

    public int getCountReply() {
        return countReply;
    }

    public void setCountReply(int count) {
        this.countReply = count;
    }

    @Override
    public String toString() {
        return "Article{" +
                "articleNum=" + articleNum +
                ", articleTitle='" + articleTitle + '\'' +
                ", articleContent='" + articleContent + '\'' +
                ", articleDate='" + articleDate + '\'' +
                ", hitcount=" + hitcount +
                ", userId='" + userId + '\'' +
                ", boardNum=" + boardNum +
                ", countReply=" + countReply +
                '}';
    }
}
