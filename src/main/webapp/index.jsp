<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ezen.index.service.ItemService" %>
<%@ page import="com.ezen.index.service.ItemServiceImpl" %>
<%@ page import="com.ezen.index.dto.Item" %>
<%@ page import="java.util.List" %>
<%--
    인덱스 페이지
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ItemService itemService = new ItemServiceImpl();
    List<Item> list = itemService.itemList();
    request.setAttribute("list", list);
%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> HAN ZO </title>

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
        <section>
            <article class="rolling-wrap">
                <div class="rolling-list"> <!-- 원본배너 -->
                    <ul>
                        <li>
                            <div class="image-wrap"></div>
                            <div class="desc">
                                <strong>HANZO CORP.</strong>
                            </div>
                        </li>
                        <li>
                            <div class="image-wrap"></div>
                            <div class="desc">
                                <a href="/item_detail/item_detail.jsp?itemNumber=9&categoryNumber=20"><strong>신상품 보러가기</strong></a>
                            </div>
                        </li>
                        <li>
                            <div class="image-wrap"></div>
                            <div class="desc">
                                <strong>한 조</strong>

                            </div>
                        </li>
                        <li>
                            <div class="image-wrap"></div>
                            <div class="desc">
                                <a href="/item_detail/item_detail.jsp?itemNumber=9&categoryNumber=20"><strong>신상품 보러가기</strong></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </article>
        </section>

        <main>
            <div class="item-wrapper">

                <ul>
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
       
    </div>


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
