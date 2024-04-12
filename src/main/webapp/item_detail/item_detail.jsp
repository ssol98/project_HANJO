<%@ page import="com.ezen.index.service.ItemServiceImpl" %>
<%@ page import="com.ezen.index.service.ItemService" %>
<%@ page import="com.ezen.index.dto.Item" %><%-- 제품 상세 정보 --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int categoryNumber = Integer.parseInt(request.getParameter("categoryNumber"));
    int itemNumber = Integer.parseInt(request.getParameter("itemNumber"));

    ItemService itemService = new ItemServiceImpl();
    Item item = itemService.itemDetail(categoryNumber, itemNumber);
    request.setAttribute("item", item);
%>
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

    <form id="mid_info_div">
            <h2 id="mid_info">Product Info 제품상세</h2>

            <div id="img_div" style="background-image:url(..${item.itemThumb}); width: 300px; height: 300px;"></div>

            <div class="item-detail-info">
                <div>${item.itemName}</div>
                <div>${item.price}</div>
                <div>${item.itemInfo}</div>
                <form>
                    <select>
                        <option>240</option>
                        <option>245</option>
                        <option>250</option>
                        <option>255</option>
                        <option>260</option>
                        <option>265</option>
                        <option>270</option>
                        <option>275</option>
                        <option>280</option>
                        <option>285</option>
                        <option>290</option>
                        <option>295</option>
                        <option>300</option>
                    </select>
                </form>
            </div>

    </div>

    <div id="button_flex">
        <button id="payment_btn"><a href="../payment/paymentComplete.jsp">바로결제</a></button>
        <button id="cart_btn">장바구니추가</button>
    </div>

    <p id="bottom_border"></p>

    <div id="bottom_flex">
        <button id="list_btn"><a href="/">계속 쇼핑하기</a></button>
        <button id="cart_move_btn"><a href="/cart/cart.jsp">장바구니 이동</a></button>
    </div>

    <%-- footer start --%>
    <jsp:include page="/module/footer.jsp"/>
<%--    <%—- footer end -—%>--%>
</div>
</body>

</html>