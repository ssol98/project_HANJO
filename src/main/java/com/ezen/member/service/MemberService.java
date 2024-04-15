package com.ezen.member.service;

import com.ezen.member.dao.JdbcMemberDao;
import com.ezen.member.dao.MemberDao;
import com.ezen.member.dto.Member;
import com.ezen.member.dto.Order;

import java.sql.SQLException;
import java.util.List;

/**
 * 회원 관련한 비즈니스 메소드 정의
 */
public class MemberService {

    private MemberDao memberDao;

    public MemberService() {
        memberDao = new JdbcMemberDao();
    }

    // 회원가입

    // 서버 입장에서 제일 먼저 받아보는 곳
    public Member registerMember(Member member) throws Exception {
        /*System.out.println(member.getPhoneNum());
        System.out.println(member.getEmail());
        System.out.println(member.getDetailAddress());
        System.out.println(member.getDefaultAddress());*/
        // 데이터 확인용 sout 여기서 null 확인
        memberDao.create(member);
        return memberDao.findById(member.getId());
    }
    // 로그인(회원인증)
    public Member login(String id, String passwd) throws SQLException {
        // 로그인 확인용 로그 출력
        System.out.println(id);
        System.out.println(passwd);
        Member loginMember = null;
        boolean isMember = memberDao.findByIdNPasswd(id, passwd);
        if(isMember){
            loginMember = memberDao.findById(id);
            System.out.println(loginMember);
        }
        return  loginMember;
    }

    /**
     * 사용자의 주문 정보를 불러오기 위함
     * 4/13 추가된 getOrderListForMember 메소드
     * @param id
     * @return
     */
    public List<Order> getOrderListForMember(String id) {
        try{
            return memberDao.orderList(id);
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }


    // 기타 등등

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        MemberService memberService = new MemberService();
        Member loginMember = memberService.login("hanzo1","1111");
        System.out.println(loginMember);
    }
}
