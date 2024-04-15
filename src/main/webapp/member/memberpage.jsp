<%@ page import="com.ezen.member.dto.Order" %>
<%@ page import="com.ezen.member.dto.Member" %>
<%@ page import="com.ezen.payment.dto.Orders" %>

<%@ page import="com.ezen.member.service.MemberService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.payment.service.OrderServiceImpl" %>
<%@ page import="com.ezen.payment.service.OrderService" %>
<%@ page import="com.ezen.index.service.ItemServiceImpl" %>
<%@ page import="com.ezen.index.service.ItemService" %>
<%@ page import="com.ezen.index.dto.Item" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 마이페이지 --%>

<jsp:useBean id="member" class="com.ezen.member.dto.Member" scope="session"/>
<%
    List<Order> orderList = (List<Order>) session.getAttribute("orderList");
    String userId = request.getParameter("userId");

    OrderService orderService = new OrderServiceImpl();
    List<Orders> list = orderService.loadOrder(userId);
    request.setAttribute("list", list);
%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>HAN ZO</title>
    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://kit.fontawesome.com/89ab2ce88f.js" crossorigin="anonymous"></script>
</head>
<style>

    thead {
        background-color: #48372f;
        color: #ffffff;
    }

    #orders-table th:first-child,
    #orders-table td:first-child {
        width: 150px;
    }

    #orders-table th:nth-child(3),
    #orders-table td:nth-child(3) {
        width: 150px;
    }
    #orders-table th:nth-child(4),
    #orders-table td:nth-child(4) {
        width: 250px;
    }



    #mypage-main{
        height: 250px;
        margin: 50px auto;
        justify-content: center;
    }
    .border{
        border: 1px solid #bb7753;
    }

    #orders-table{
        margin: 60px auto ;
        width: 900px;
        border: 1px solid #48372f;


    }

</style>

<body>
<div class="d-flex" id="wrapper">

    <!-- header start -->
    <jsp:include page="/module/header.jsp"/>
    <!-- header end -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <%--nav start--%>
            <jsp:include page="/module/nav.jsp"/>
        <%--nav end--%>

        <%--Contents start--%>
        <div style="margin: 40px auto; border-bottom: 7px solid #48372f; width: 500px" class="container-fluid">
            <h3 style="text-align: center; " class="mt-4"> 마이페이지 </h3>
        </div>

        <div class="container text-center">
            <div id="mypage-main" class="row">
                <%--                    <div class="mypage-image" style="border: 1px solid black"><a href="memberinfo.jsp">이미지</a><br>  &lt;%&ndash; 이미지 구역 구분 위해서 border 지정 해놓음 &ndash;%&gt;--%>

                <%--                    </div>--%>
                <a href="memberinfo.jsp">
                    <div id="member-info">
                        <br>
                        <br>
                        <br>
                        안녕하세요 ${loginMember.name}님 <br>
                        <br>
                        고객님의 회원등급은 <strong style="color: #7abaff">다이아몬드</strong>입니다.
                    </div>
                </a>


                <div class="col-8 border" >
                    <br>
                    <br>
                    <br>
                    <br>

                    주문완료 상품 총 [<%= list.size() %>] 건</div>

            </div>
        </div>


        <div style="margin: 40px auto; border-bottom: 7px solid #48372f; width: 500px" class="container-fluid">
            <h3 style="text-align: center; " class="mt-4"> 주문 리스트 </h3>
        </div>


        <table id="orders-table" class="table">

            <thead>
            <tr>
                <th scope="col">주문 번호</th>
                <th scope="col">수취인 이름</th>
                <th scope="col">주문 가격</th>
                <th scope="col">주문 일시</th>
            </tr>
            </thead>

            <tbody>

<%--            <c:forEach var="order" items="${orderList}">--%>
<%--                <tr>--%>
<%--                    <th scope="row">${order.orderDate}</th>--%>
<%--                        &lt;%&ndash; 주문번호에 등록된 모든상품이름 출력  <td>${order.itemNames} 등</td> &ndash;%&gt;--%>
<%--                    <td>[${order.itemNames[0]}..] </td>--%>
<%--                    <td>${order.totalPrice}원</td>--%>
<%--                    <td>${order.orderNum}</td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
                <c:forEach var="order" items="${list}">
                    <tr>
                        <th scope="row">${order.orderNumber}</th>
                            <%-- 주문번호에 등록된 모든상품이름 출력  <td>${order.itemNames} 등</td> --%>
                        <td>${order.receiverName} </td>
                        <td>₩ ${order.totalPrice}</td>
                        <td>${order.regdate}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </div>
    <%--    footer start --%>
    <jsp:include page="/module/footer.jsp"/>
    <%--    footer end--%>
</div>
<!-- Wrapper End -->

<!-- Bootstrap core JavaScript -->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>
</body>
</html>

