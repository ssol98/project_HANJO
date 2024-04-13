package com.ezen.member.dao;

import com.ezen.member.dto.Member;

import java.sql.SQLException;
import java.util.List;

/**
 * 회원관련 Database 처리 명세 (역할)
 */
public interface MemberDao {

    public void create(Member member) throws Exception;

    public Member findById(String id) throws SQLException;

    public boolean findByIdNPasswd(String id, String passwd) throws SQLException;

    public List<Member> findByAll() throws SQLException;

    public Member orderList(String id)throws SQLException;


}
