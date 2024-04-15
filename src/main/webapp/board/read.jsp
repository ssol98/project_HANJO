<%@ page import="com.ezen.board.dto.Article" %>
<%@ page import="com.ezen.board.service.BoardServiceImpl" %>
<%@ page import="com.ezen.board.service.BoardService" %>
<%@ page import="com.ezen.board.dto.ArticleComment" %>
<%@ page import="com.ezen.board.dao.JdbcArticleDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ezen.mall.web.common.encription.EzenUtil" %><%--게시글 읽기 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:useBean id="acList" class="com.ezen.board.dto.ArticleComment" scope="page"/>--%>
<%--<c:if test="${empty loginMember}">--%>
<%--    <c:set scope="request" var="message" value="게시판 글읽기는 회원만 가능합니다!"/>--%>
<%--    <jsp:forward page="/member/login.jsp"/>--%>
<%--</c:if>--%>
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

    System.out.println(articleNum);
    System.out.println(boardNum);

    BoardService boardService = new BoardServiceImpl();
    Article article = boardService.getReadArticle(Integer.parseInt(articleNum), Integer.parseInt(boardNum));

    request.setAttribute("article", article);

    JdbcArticleDao jdao = new JdbcArticleDao();

    int an = jdao.findByReplyCount(Integer.parseInt(articleNum));
    List<ArticleComment> acList = jdao.commentListAll(articleNum);
    pageContext.setAttribute("acList", acList);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HAN ZO</title>

    <link rel="stylesheet" href="/css/article.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://kit.fontawesome.com/89ab2ce88f.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="wrapper">
    <!-- header start -->
    <jsp:include page="/module/header.jsp"/>
    <!-- header end -->

    <!-- nav start -->
    <jsp:include page="/module/nav.jsp"/>
    <!-- nav start -->
    <section class="notice">
        <div class="page-title">
            <div class="container">
                <div class="title" readonly>
                    <h3>${article.articleTitle}</h3>
                </div>
                <div class="blog-profile">
                    <div class="blog-profile_text" readonly>
                        <h4>${article.userId}</h4>
                    </div>
                </div>
                <div class="blog-left">
                    <div class="blog-content" readonly>
                        <p>${article.articleContent}</p>
                    </div>
                    <div class="blog-share-reply">
                        <p>댓글(<%=an%>)</p>
                    </div>
                    <div class="reply-table">
                        <c:if test="${not empty acList}">
                            <c:forEach var="ac" items="${acList}" varStatus="loop">
                                <c:set var="no" scope="request"></c:set>
                                <div>
                                    <span class="reply-id">${ac.userId}</span>
                                    |
                                    <span class="reply-text">${ac.commentContent}</span>
                                </div>
                            </c:forEach>
                        </c:if>
                        <div class="reply-add">
                            <input class="reply-input"></input>
                            <button class="reply-btn">작성</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</div>
<%-- footer start --%>
<jsp:include page="/module/footer.jsp"/>
<%-- footer end --%>
<script>
    let replyBtn = document.querySelector('.reply-btn');
    console.log(replyBtn)
    replyBtn.addEventListener('click',function(){
        let replyInput = document.querySelector('.reply-input');
        console.log(replyInput.value);
        if(replyInput.value != ""){
            window.location.href = "read-action.jsp?boardNum=${article.boardNum}&articleNum=${article.articleNum}&replyInput="+replyInput.value;
        }
    })
</script>
</body>
</html>