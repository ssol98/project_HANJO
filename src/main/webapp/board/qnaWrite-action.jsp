<%@ page import="com.ezen.board.service.BoardService" %>
<%@ page import="com.ezen.board.service.BoardServiceImpl" %>
<%--
  게시글 쓰기 처리
  User: SHINYJ
  Date: 2024-03-29
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>

<%request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="article" class="com.ezen.board.dto.Article" scope="request"/>
<jsp:setProperty name="article" property="*"/>

<%
    int boardNum= Integer.parseInt(request.getParameter("boardNum"));
    String passwd = "1111";
    article.setBoardNum(boardNum);
    article.setUserId(passwd);

    BoardService boardService = new BoardServiceImpl();
    boardService.writeArticle(article);

    response.sendRedirect("list.jsp?boardId="+boardNum);

%>
