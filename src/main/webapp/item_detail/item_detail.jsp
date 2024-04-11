<%-- 제품 상세 정보 --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HAN ZO</title>

    <link rel="stylesheet" href="/css/item_detail.css">
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

<div id="top_img_flex">
    <img src="../img/item-detail-shoes.jpg">
</div>

<div id="mid_info_div">
    <h3 id="mid_info">Product Info 제품상세
    </h3>
    <h4>카테고리번호</h4>
    <h4>제품번호</h4>
    <h4>제품이름</h4>
    <h4>제품가격</h4>
    <h4>제품정보(설명)</h4>
    <h4>판매여부(Y == "", N == 품절)</h4>

</div>

<div id="button_flex">
    <button id="payment_btn"><a href="../payment/paymentComplete.jsp">바로결제</a></button>
    <button id="cart_btn"><a href="">장바구니추가</a></button>
</div>

<p id="bottom_border"></p>

<div id="bottom_flex">
    <button id="list_btn"><a href="">계속 쇼핑하기</a></button>
</div>

<%-- footer start --%>
<jsp:include page="/module/footer.jsp"/>
<%-- footer end --%>
</div>
</body>

</html>