<%@ page import="com.ezen.board.dto.Article" %>
<%@ page import="com.ezen.board.service.BoardServiceImpl" %>
<%@ page import="com.ezen.board.service.BoardService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.board.dao.JdbcArticleDao" %>
<%@ page import="com.ezen.mall.web.common.page.Pagination" %>
<%@ page import="com.ezen.mall.web.common.page.PageParams" %>
<%@ page import="com.ezen.mall.web.common.encription.EzenUtil" %><%--게시글 읽기 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<c:if test="${empty loginMember}">--%>
<%--    <c:set scope="request" var="message" value="게시판 글쓰기는 회원만 가능합니다!"/>--%>
<%--    <c:set var="referer" value="/board/register.jsp" scope="request"/>--%>
<%--    <jsp:forward page="/member/login.jsp"/>--%>
<%--</c:if>--%>
<%
    int boardNum = 20;
    if (request.getParameter("boardNum") != null) {
        boardNum = Integer.parseInt(request.getParameter("boardNum"));
    }
    int requestPage = 1;
    if (request.getParameter("page") != null) {
        requestPage = Integer.parseInt(request.getParameter("page"));
    }
    int rowCount = 10;
    if (request.getParameter("count") != null) {
        rowCount = Integer.parseInt(request.getParameter("count"));
    }

    int pageSize = 10;

    Cookie[] cookie = request.getCookies();
    String userId = new String();
    for (int i = 0; i < cookie.length; i++) {
        if (cookie[i].getName().equals("saveId")) {
            userId = EzenUtil.decription(cookie[i].getValue());
            System.out.println(userId);
            break;
        }
    }
    String searchType = request.getParameter("searchType");
    String searchValue = request.getParameter("searchText");

    BoardService boardService = new BoardServiceImpl();
    List<Article> list = boardService.articleList(rowCount, boardNum, requestPage, searchType, searchValue);
    request.setAttribute("list", list);

    int tableRowCount = boardService.getArticleCount(boardNum, searchType, searchValue);
    PageParams params = new PageParams(rowCount, pageSize, requestPage, tableRowCount);
    Pagination pagination = new Pagination(params);
    request.setAttribute("pagination", pagination);

    String writeTitle = request.getParameter("writeTitle");
    String writeContent = request.getParameter("writeContent");

    Article ac = new Article();
    JdbcArticleDao jdao = new JdbcArticleDao();
    if (request.getParameter("writeTitle") != null) {
        ac.setArticleTitle(writeTitle);
        ac.setArticleContent(writeContent);
        ac.setHitcount(0);
        ac.setUserId(userId);
        ac.setBoardNum(boardNum);
        jdao.createArticle(ac);
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HAN ZO</title>
    <link rel="stylesheet" href="../css/article.css">
    <link rel="stylesheet" href="../css/style.css">
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
                <div class="title">
                    <h4>상품 Q&A 게시글 작성</h4>
                </div>
                <div>
                    <input class="write-title" placeholder="제목을 입력해주세요."></input>
                </div>
                <div class="user-id">
                    <div class="user-id_text" readonly>
                        <h4><%=userId%></h4>
                    </div>
                </div>
                <div class="content">
                    <div class="blog-content">
                        <textarea type="text" class="write-content" name="article_content" placeholder="내용을 입력해주세요."></textarea>
                    </div>
                </div>
                <div class="write-add">
                    <button type="button" class="btn btn-dark write-btn"><i class="fa-solid fa-pencil"></i>  작성</button>
                    <button type="button" class="write-cancel" onclick="location.href='qna.jsp'">취소</button>
                </div>
            </div>
        </div>
    </section>
</div>
<%-- footer start --%>
<jsp:include page="/module/footer.jsp"/>
<%-- footer end --%>
<script>
    let writeBtn = document.querySelector('.write-btn');
    console.log(writeBtn)
    writeBtn.addEventListener('click', function () {
        let writeTitle = document.querySelector('.write-title');
        let writeContent = document.querySelector('.write-content');
        window.location.href = "qna.jsp?writeTitle=" + writeTitle.value + "&writeContent=" + writeContent.value;
    })
</script>
</body>
</html>