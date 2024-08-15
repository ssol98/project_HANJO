<%@ page import="com.ezen.board.service.BoardService" %>
<%@ page import="com.ezen.board.service.BoardServiceImpl" %>


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
