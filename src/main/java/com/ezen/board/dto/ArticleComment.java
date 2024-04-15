package com.ezen.board.dto;
import java.util.*;
public class ArticleComment {
    private int commentNum;
    private String commentContent;
    private String commentDate;
    private int articleNum;
    private String userId;

    public ArticleComment(){}

    public ArticleComment(int commentNum, String commentContent, String commentDate, int articleNum, String userId) {
        this.commentNum = commentNum;
        this.commentContent = commentContent;
        this.commentDate = commentDate;
        this.articleNum = articleNum;
        this.userId = userId;
    }

    public int getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(int commentNum) {
        this.commentNum = commentNum;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }

    public int getArticleNum() {
        return articleNum;
    }

    public void setArticleNum(int articleNum) {
        this.articleNum = articleNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "ArticleComment{" +
                "commentNum=" + commentNum +
                ", commentContent='" + commentContent + '\'' +
                ", commentDate=" + commentDate +
                ", articleNum=" + articleNum +
                ", userId='" + userId + '\'' +
                '}';
    }
}
