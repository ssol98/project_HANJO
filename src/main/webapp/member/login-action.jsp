<%@ page import="com.ezen.member.service.MemberService" %>
<%@ page import="com.ezen.member.dto.Member" %>
<%@ page import="com.ezen.mall.web.common.encription.EzenUtil" %>
<%@ page import="com.ezen.member.dto.Order" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id = request.getParameter("loginid");
    String passwd = request.getParameter("loginpw");
    String saveId = request.getParameter("saveid");
    String referer = request.getParameter("referer");
    String message = request.getParameter("message");

    if (referer == null){
        referer = "/";

    }

    MemberService memberService = new MemberService();
    Member loginMember = memberService.login(id, passwd);

    if (loginMember != null) {
        if (saveId != null) {
            Cookie saveIdCookie = new Cookie("saveId", EzenUtil.encription(id));
            saveIdCookie.setMaxAge(60 * 60 * 24 * 100); //100일로 저장
            saveIdCookie.setPath("/");
            response.addCookie(saveIdCookie);
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("saveId")) {
                        cookie.setPath("/");
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
        }
        session.setAttribute("loginMember", loginMember);

        List<Order> orderList = memberService.getOrderListForMember(id);
        session.setAttribute("orderList", orderList);

        response.sendRedirect(referer);
//        System.out.println("-------로그인멤버------");
//        System.out.println(loginMember);
//        System.out.println("-------로그인멤버------");
//        System.out.println("-------오더리스트------");
//        System.out.println(orderList);
//        System.out.println("-------오더리스트------");

        session.removeAttribute("cartItems");
    } else {
%>
<script>
    alert("아이디와 비밀번호를 확인하세요.");
    location.href = '/member/login.jsp?referer=<%=referer%>';
</script>
<%
    }

%>
