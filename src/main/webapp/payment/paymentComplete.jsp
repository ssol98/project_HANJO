<%@ page import="com.ezen.index.service.ItemServiceImpl" %>
<%@ page import="com.ezen.index.dto.Item" %>
<%@ page import="com.ezen.index.service.ItemService" %>
<%@ page import="com.ezen.payment.service.OrderServiceImpl" %>
<%@ page import="com.ezen.payment.service.OrderService" %><%-- 결제 완료 창 --%>


<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String userId = request.getParameter("userId");
    String itemPrice = request.getParameter("itemPrice");
    int categoryNumber = Integer.parseInt(request.getParameter("itemCategory"));
    int itemNumber = Integer.parseInt(request.getParameter("itemNumber"));

    ItemService itemService = new ItemServiceImpl();
    Item item = itemService.itemDetail(categoryNumber, itemNumber);
    request.setAttribute("item", item);

    OrderService orderService = new OrderServiceImpl();
    orderService.createOrder(userId, itemPrice);
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제완료</title>

    <style>
        /* 기본값 세팅 */
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            width: 100vw;
            height: 100vh;
        }

        a {
            text-decoration: none;
        }

        /* 상단 이미지 DIV 플렉스 */
        #topFlex {
            display: flex;
            text-align: center;
            justify-content: center;
        }

        /* 상단 이미지 */
        #topImg {
            width: 10%;
            margin-top: 7%;
            margin-bottom: 3%;
        }

        /* 결제 성공 메시지 */
        #completeMsg {
            text-align: center;
            font-size: xx-large;
            margin-bottom: 5%;
        }

        #payInfo {
            text-align: center;
            border-bottom: 1px solid black;
            margin: 10px auto;
            padding: 10px 0px;

        }

        /* 결제 정보 박스 */
        #payInfoDiv {
            text-align: center;
            width: 50%;
            margin: 0 auto;
        }

        #payInfoDiv h4 {
            width: 170px;
            margin: 10px auto;
        }

        /* 결제 정보 밑줄 */
        #payInfo::after {
            content: "";
            display: block;
            width: 50%;
            margin-left: 35%;
        }

        .payInfo-detail {
            width: 60%;
            height: 100%;
            margin: 0 auto;
            display: inline-block;
        }

        .payInfo-detail-left{
            float: left;
            text-align: left;
            padding-left: 60px;

        }
        .payInfo-detail-left h4{
            margin-bottom: 20px;
        }

        .payInfo-detail-right{
            float: right;
            text-align: center;

        }

        .payInfo-detail-value {
            width: 20%;
            height: 100%;
            display: inline-block;
        }

        .payInfo-detail-value h4 {
            width: 100px;
            margin: 10px auto;
        }


        /* 하단 버튼 플렉스 박스 */
        #rowFlex {
            display: flex;
            text-align: center;
            justify-content: center;
            margin-top: 3%;
        }

        /* 홈 버튼 */
        #homeBtn {
            margin-right: 0.5%;
            width: 10%;
            font-size: large;
        }

        #homeBtn a {
            color: #000;

        }

        #homeBtn:hover {

        }

        /* 마이페이지 버튼 */
        #mypageBtn {
            margin-left: 0.5%;
            width: 10%;
            font-size: large;
        }

        #mypageBtn a {
            color: #000;
        }
    </style>
    <%--  <link rel="stylesheet" href="../css/style.css">--%>

</head>

<body>
<!-- 상단 이미지 플렉스 박스 -->

<div id="topFlex">
    <!-- 체크 이미지 -->
    <img src="../img/payment_complete.png" id="topImg">
</div>

<!-- 결제 성공 메시지 -->
<p id="completeMsg"><strong>결제</strong>가 성공적으로 <strong>완료</strong>되었습니다.</p>

<!-- 결제 정보 박스 -->
<div id="payInfoDiv">
    <h3 id="payInfo">주문 정보</h3>
    <div class="payInfo-detail">
        <div class="payInfo-detail-left">
            <h4>* 주문상품 : </h4>
            <h4>* 주문가격 : </h4>
            <h4>* 수취인 이름 :</h4>
            <h4>* 수취인 우편번호 : </h4>
            <h4>* 수취인 주소 + 상세주소 : </h4>
            <h4>* 수취인 휴대폰번호 : </h4>
        </div>
        <div class="payInfo-detail-right">
            <h4> ${item.itemName} </h4>
            <h4> ₩ ${item.price} </h4>
            <h4>  ${loginMember.name} </h4>
            <h4> ${loginMember.postNum} </h4>
            <h4> ${loginMember.defaultAddress} , ${loginMember.detailAddress} </h4>
            <h4> ${loginMember.phoneNum} </h4>

        </div>
    </div>
    <form class="payInfo-detail-value">

    </form>
</div>

<!-- 하단 버튼 플렉스 박스 -->
<div id="rowFlex">
    <button id="homeBtn"><a href="/">홈으로</a></button>
    <button id="mypageBtn"><a href="../member/memberpage.jsp?userId=${loginMember.id}">마이페이지</a></button>
</div>
</body>

</html>



