<%@ page import="com.ezen.index.service.ItemServiceImpl" %>
<%@ page import="com.ezen.index.service.ItemService" %>
<%@ page import="com.ezen.index.dto.Item" %>
<%@ page import="java.util.ArrayList" %><%-- 제품 상세 정보 --%>

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


    <h2 id="mid_info" style="margin-top: 20px; margin-bottom: 20px">Product Info 제품상세</h2>


    <div class="item-detail-wrapper">

        <div class="item-img-info">
            <form>
                <div id="img_div" style="background-image:url(..${item.itemThumb}); width: 300px; height: 300px;"></div>

                <div class="item-detail-info">
                    <div class="item-detail-info-div"><strong>${item.itemName}</strong></div>
                    <div class="item-detail-info-div">${item.price}</div>
                    <div class="item-detail-info-div">${item.itemInfo}</div>

                    <span>사이즈 선택 : </span>
                    <select name="size" style="margin-top: 20px">
                        <option value="240">240</option>
                        <option value="245">245</option>
                        <option value="250">250</option>
                        <option value="255">255</option>
                        <option value="260">260</option>
                        <option value="265">265</option>
                        <option value="270">270</option>
                        <option value="275">275</option>
                        <option value="280">280</option>
                        <option value="285">285</option>
                        <option value="290">290</option>
                        <option value="295">295</option>
                        <option value="300">300</option>
                    </select>
                </div>
            </form>
        </div>


        <div id="button_flex">
            <c:if>

            </c:if>
            <button id="payment_btn"><a
                    href="../payment/paymentComplete.jsp?itemNumber=${item.itemNumber}&itemCategory=${item.itemCategory}&itemPrice=${item.price}&userId=${loginMember.id}">바로결제</a>
            </button>
            <form class="needs-validation" action="/cart/cart-action.jsp" method="post">
                <input type="hidden" name="item" value="
                <% if (item != null) { %>
            <%--        <%= item.getItemImage() %>--%>
                    <%= item.getItemName() %>
                    <%= item.getPrice() %>
                <% } %>">
                <button id="cart_btn"><a>장바구니추가</a></button>
            </form>
        </div>
    </div>


    <p id="bottom_border"></p>

    <div id="bottom_flex">
        <button id="list_btn"><a href="/">계속 쇼핑하기</a></button>
        <button id="cart_move_btn"><a href="/cart/cart.jsp">장바구니 이동</a></button>
    </div>

    <%-- footer start --%>
    <jsp:include page="/module/footer.jsp"/>
    <%--    <%—- footer end -—%>--%>
<%--    <script>--%>

<%--        // alert(document.productForm.count.value);--%>
<%--        document.productForm.addEventListener("submit", event => {--%>
<%--            event.preventDefault();--%>
<%--            let pid = document.productForm.pid.value;--%>
<%--            let price = document.productForm.price.value;--%>
<%--            let count = document.productForm.count.value;--%>
<%--            event.target.submit();--%>

<%--        });--%>
<%--    </script>--%>
</div>
</body>

</html>
