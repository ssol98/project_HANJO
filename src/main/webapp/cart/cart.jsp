<%-- 장바구니 --%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
  String size = request.getParameter("size");

%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HAN ZO</title>
  <link rel="stylesheet" href="/css/cart.css">
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

  <div class="">
  <h2 id="top_text">장바구니</h2>
  <table>
    <thead>
      <tr>
        <th><input type="checkbox"></th>
        <th>이미지</th>
        <th>상품명</th>
        <th>판매금액</th>
        <th>수량 <!-- +- 변경 가능하게 --> </th>
        <th>주문금액 <!-- (판매금액*수량) --> </th>
      </tr>
    </thead>

    <tbody>
      <tr>
        <td><input type="checkbox"></td>
        <td>더미</td>
        <td>더미</td>
        <td>더미</td>
        <td>더미</td>
        <td>더미</td>
      </tr>
      <tr>
        <td><input type="checkbox"></td>
        <td>더미</td>
        <td>더미</td>
        <td>더미</td>
        <td>더미</td>
        <td>더미</td>
      </tr>
    </tbody>
    <tfoot>
      <tr>
        <th colspan="4"></th>
        <th>총 주문금액</th>
        <th>얼마</th>
      </tr>
    </tfoot>
  </table>

  <div id="button_flex">
    <button id="check_remove">선택삭제</button>
    <button id="all_remove">모두삭제</button>
    <button id="move_list"><a href="">계속 쇼핑하기</a></button>
    <button id="order"><a href="">주문하기</a></button>
  </div>

<%--      footer start --%>
  <jsp:include page="/module/footer.jsp"/>
<%--      footer end--%>
  </div>
</div>
</body>

</html>