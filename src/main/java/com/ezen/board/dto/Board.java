package com.ezen.board.dto;

public class Board {
    private int boardNum;
    private String boardName;
    private String boardInfo;

    public Board(){}

    public Board(int boardNum, String boardName, String boardInfo) {
        this.boardNum = boardNum;
        this.boardName = boardName;
        this.boardInfo = boardInfo;
    }

    public int getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(int boardNum) {
        this.boardNum = boardNum;
    }

    public String getBoardName() {
        return boardName;
    }

    public void setBoardName(String boardName) {
        this.boardName = boardName;
    }

    public String getBoardInfo() {
        return boardInfo;
    }

    public void setBoardInfo(String boardInfo) {
        this.boardInfo = boardInfo;
    }

    @Override
    public String toString() {
        return "Board{" +
                "boardNum=" + boardNum +
                ", boardName='" + boardName + '\'' +
                ", boardInfo='" + boardInfo + '\'' +
                '}';
    }
}
