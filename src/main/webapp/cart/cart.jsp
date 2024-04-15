<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ezen.index.dto.Item" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HAN ZO</title>
    <link rel="stylesheet" href="/css/cart.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://kit.fontawesome.com/89ab2ce88f.js" crossorigin="anonymous"></script>
    <script>
        function selectAll(selectAll) {
            const checkboxes
                = document.querySelectorAll('input[type="checkbox"]');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }
        function selectAll(selectAll) {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            });
        }

        function removeSelectedItems() {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            const itemsToRemove = [];
            checkboxes.forEach((checkbox) => {
                if (checkbox.checked) {
                    itemsToRemove.push(checkbox.parentElement.parentElement);
                }
            });
            itemsToRemove.forEach((item) => {
                item.remove();
            });
        }

        function removeAllItems() {
            const cartTable = document.querySelector('table tbody');
            cartTable.innerHTML = '<tr><td colspan="2">장바구니에 상품이 없습니다.</td></tr>';
        }
    </script>

</head>

<body>
<div id="wrapper">
    <!-- header start -->
    <jsp:include page="/module/header.jsp"/>
    <!-- header end -->

    <!-- nav start -->
    <jsp:include page="/module/nav.jsp"/>
    <!-- nav start -->

    <div class="">
        <h2 id="top_text">장바구니 목록</h2>
        <div class="cart_info" style="margin-bottom: 30px">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <table>
            <thead>
            <tr>
                <th><input type="checkbox" value="selectAll" onclick="selectAll(this)"></th>
                <th>상품정보</th>

            </tr>
            </thead>
            <tbody>
            <% ArrayList<String> cartItems = (ArrayList<String>) session.getAttribute("cartItems");
                if (cartItems != null && !cartItems.isEmpty()) {
                    for (String item : cartItems) { %>
            <tr>
                <td><input type="checkbox"></td>
                <td><%= new String(item.getBytes("ISO-8859-1"), "UTF-8") %>
                </td>
            </tr>
            <% }
            } else { %>
            <tr>
                <td colspan="2">장바구니에 상품이 없습니다.</td>
            </tr>
            <% } %>
            </tbody>

        </table>

        <div id="button_flex">
            <button id="check_remove" onclick="removeSelectedItems()">선택삭제</button>
            <button id="all_remove" onclick="removeAllItems()">모두삭제</button>
            <button id="move_list"><a href="">계속 쇼핑하기</a></button>
            <button id="order"><a href="">주문하기</a></button>
        </div>

        <%-- footer start --%>
        <jsp:include page="/module/footer.jsp"/>
        <%-- footer end--%>
    </div>
</div>
</body>

</html>
