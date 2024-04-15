package com.ezen.board.service;

import com.ezen.board.dao.ArticleDao;
import com.ezen.board.dao.JdbcArticleDao;
import com.ezen.board.dto.Article;
import com.ezen.board.dto.Board;

import java.sql.SQLException;
import java.util.List;

public class BoardServiceImpl implements BoardService {
    ArticleDao articleDao = new JdbcArticleDao();
    @Override
    public List<Board> boardList() {
        try {
            return articleDao.findByBoardAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void writeArticle(Article article) {
        try {
            articleDao.createArticle(article);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Article> articleList(int rowCount, int boardNum, int requestPage, String type, String value) {
        try {
            return articleDao.findByAll(rowCount, boardNum, requestPage, type, value);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int getArticleCount(int boardNum, String type, String value) {
        int count = 0;
        try {
            count = articleDao.findByArticleCount(boardNum, type, value);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

    @Override
    public int getReplyCount(int articleNum) {
        int count = 0;
        try {
            count = articleDao.findByReplyCount(articleNum);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

    @Override
    public Article getReadArticle(int articleNum, int boardNum) {
        Article article = null;
        try {
            article = articleDao.readArticle(articleNum, boardNum);
            articleDao.updateArticleHitCount(articleNum, boardNum);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return article;
    }
}
