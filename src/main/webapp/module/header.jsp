<%--
  header 모듈
  (맨 위에 흰색 bar + 배너)
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="head-info">
    <a href="/"><img src="../img/logo.png" style="width:300px; height:40px; margin-right: 290px"></a>

    <c:choose>
        <c:when test="${empty loginMember}">
            <h2><a href="../member/login.jsp?referer=<%=request.getRequestURI()%>">로그인</a></h2>
            <h2><a href="/member/register.jsp">회원가입</a></h2>
        </c:when>
        <c:otherwise>
            <h2><a href="../member/memberpage.jsp?userId=${loginMember.id}"><i class="fa-solid fa-user"></i>   <i style="font-size: 10pt">${loginMember.name}</i> 님</a></h2>
            <h2><a href="../member/logout-action.jsp">로그아웃</a></h2>
        </c:otherwise>
    </c:choose>

    <%--    <h2><a href="../member/login.jsp?referer=<%=request.getRequestURI()%>">로그인</a></h2>--%>
    <%--    <h2><a href="/member/register.jsp">회원가입</a></h2>--%>
    <%--    <h2><a href="../member/memberpage.jsp"><i class="fa-solid fa-user"></i></a></h2>--%>
    <h2><a href="../cart/cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a></h2>
    <h2><a href="../board/announcement.jsp">공지사항</a></h2>
    <h2><a href="../board/qna.jsp">Q & A</a></h2>
</div>
<header>
</header>