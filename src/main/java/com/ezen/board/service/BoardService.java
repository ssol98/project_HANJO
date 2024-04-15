package com.ezen.board.service;

import com.ezen.board.dto.Article;
import com.ezen.board.dto.Board;

import java.util.List;

/**
 * 게시판 관련 비즈니스 로직 선언
 */
public interface BoardService {

    /**
     * 게시판 목록 반환
     * @return 게시판 목록
     */
    public List<Board> boardList();

    /**
     * 신규 게시글 쓰기
     * @param article 게시글
     */
    public void writeArticle(Article article);

    /**
     * 게시글 목록 반환
     * @param
     */
    public List<Article> articleList(int rowCount,int boardNum, int requestPage, String type, String value);

    /**
     * 게시글 갯수 반환
     * @return 게시글 갯수
     */
    public int getArticleCount(int boardNum, String type, String value);

    /**
     * 댓글 갯수 반환
     * @param articleNum
     * @return
     */
    public int getReplyCount(int articleNum);

    /**
     *
     * @param articleNum 상세보기 하려는 게시글 번호
     * @return 게시글 내용
     */
    public Article getReadArticle(int boardNum, int articleNum);
}
