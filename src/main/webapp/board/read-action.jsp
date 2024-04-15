<%@ page import="com.ezen.member.service.MemberService" %>
<%@ page import="com.ezen.member.dto.Member" %>
<%@ page import="com.ezen.mall.web.common.encription.EzenUtil" %>
<%@ page import="com.ezen.board.dto.ArticleComment" %>
<%@ page import="com.ezen.board.dao.JdbcArticleDao" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Cookie[] cookie = request.getCookies();
    String userId = new String();
    for (int i = 0; i < cookie.length; i++) {
        if (cookie[i].getName().equals("saveId")) {
            userId = EzenUtil.decription(cookie[i].getValue());
            System.out.println(userId);
            break;
        }
    }
    String articleNum = request.getParameter("articleNum");
    String boardNum = request.getParameter("boardNum");
    String replyInput = request.getParameter("replyInput");

    JdbcArticleDao jdao = new JdbcArticleDao();
    ArticleComment ac = new ArticleComment();

    ac.setCommentContent(replyInput); // 건들필요 없음
    ac.setUserId(userId); //  로그인 관련 대체 해야 할 부분
    ac.setArticleNum(Integer.parseInt(articleNum)); // 건들필요 없음
    ac.setCommentNum(1); // 나중에 seq 만들어서 대체 해야할 부분
    ac.setCommentDate("202404-13"); //  sysdate 로 대체되어 있어서 수정 안해도됨
    if(replyInput != null){
        jdao.createReply(ac);
    }
%>

<script>
    location.href = '/board/read.jsp?boardNum=<%=boardNum%>&articleNum=<%=articleNum%>';
</script>
