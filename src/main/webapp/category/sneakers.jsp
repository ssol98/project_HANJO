<%@ page import="com.ezen.index.dto.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.index.service.ItemServiceImpl" %>
<%@ page import="com.ezen.index.service.ItemService" %><%--
    스니커즈 페이지
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ItemService itemService = new ItemServiceImpl();
    List<Item> list = itemService.sneakersList();
    request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> HAN ZO </title>

    <%--    <link rel="preconnect" href="https://fonts.googleapis.com">--%>
    <%--    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
    <%--    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap"
          rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">

    <%--  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"/>
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://kit.fontawesome.com/89ab2ce88f.js" crossorigin="anonymous"></script>

</head>
<!-- css-basic 에 있는 selector-target 참조 -->

<body>
<div id="wrapper">
    <!-- header start -->
    <jsp:include page="/module/header.jsp"/>
    <!-- header end -->

    <!-- nav start -->
    <jsp:include page="/module/nav.jsp"/>
    <!-- nav start -->

    <div id="content-wrapper">


        <main>
            <div class="item-wrapper">
<%--                <form class="item-option-bar">--%>
<%--                    <div class="item-sort">--%>
<%--                        <i class="fa-solid fa-server"></i>--%>
<%--                        <span>이름</span>--%>
<%--                        <span>낮은 가격순</span>--%>
<%--                        <span>높은 가격순</span>--%>
<%--                    </div>--%>
<%--                    <div class="item-search">--%>
<%--                        <input type="text" name="" id="" placeholder=" - 상품을 검색하세요" maxlength="15">--%>
<%--                        <button type="submit" id=""><i class="fa-solid fa-magnifying-glass"></i></button>--%>
<%--                    </div>--%>
<%--                </form>--%>
                <ul>
                    <%--     li를 반복하면서 전체 상품 리스트를 출력  --%>
                    <c:forEach var="item" items="${list}" varStatus="loop">
                        <c:set var="no" scope="request"></c:set>
                        <li id="" class="item" name="item-1">
                            <a href="../item_detail/item_detail.jsp?itemNumber=${item.itemNumber}&categoryNumber=${item.itemCategory}">  <%-- 각 상품마다 item number 지정 --%>
                                <div class="item-photo" name="" style="background-image: url(${item.itemThumb})"></div>
                                <div class="item-title" name="">${item.itemName}</div>
                                <div class="item-price" name="">${item.price}</div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </main>
        <%--      <ul class="pagination h-100 justify-content-center align-items-center">--%>

        <%--        <c:if test="${pagination.showFirst}">--%>
        <%--          <li class="page-item"><a class="page-link" href="?page=1&type=${param.type}&value=${value}">처음으로</a>--%>
        <%--          </li>--%>
        <%--        </c:if>--%>
        <%--        <c:if test="${pagination.showPrevious}">--%>
        <%--          <li class="page-item"><a class="page-link"--%>
        <%--                                   href="?page=${pagination.previousStartPage}&type=${param.type}&value=${value}">이전목록</a>--%>
        <%--          </li>--%>
        <%--        </c:if>--%>

        <%--        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">--%>
        <%--          <c:url var="list" value="list.jsp" scope="request">--%>
        <%--            <c:param name="page" value="${i}"/>--%>
        <%--            <c:param name="type" value="${param.type}"/>--%>
        <%--            <c:param name="value" value="${param.value}"/>--%>
        <%--          </c:url>--%>
        <%--          <li class="page-item <c:if test="${i == pagination.params.requestPage}">active</c:if>">--%>
        <%--            <a class="page-link" href="${list}">${i}</a></li>--%>
        <%--        </c:forEach>--%>

        <%--        <c:if test="${pagination.showNext}">--%>
        <%--          <li class="page-item"><a class="page-link"--%>
        <%--                                   href="?page=${pagination.nextStartPage}&type=${param.type}&value=${value}">다음목록</a>--%>
        <%--          </li>--%>
        <%--        </c:if>--%>
        <%--        <c:if test="${pagination.showLast}">--%>
        <%--          <li class="page-item"><a class="page-link"--%>
        <%--                                   href="?page=${pagination.totalPages}&type=${param.type}&value=${value}">끝으로</a>--%>
        <%--          </li>--%>
        <%--        </c:if>--%>

        <%--      </ul>--%>
    </div>
<%--    <hr>--%>

    <%--    footer start --%>
    <jsp:include page="/module/footer.jsp"/>
    <%--    footer end--%>

</div>
<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa-solid fa-angles-up"></i></button>
</body>
<script src="/js/main.js"></script>
<script src="/js/rolling-list.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</html>