<%-- 마이페이지 --%>


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


    #mypage-main {
        height: 250px;
        margin: 50px auto;
        justify-content: center;
    }

    .border {
        border: 1px solid #bb7753;
    }

    #orders-table {
        margin: 60px auto;
        width: 1400px;


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
                <div>
                    <br>
                    안녕하세요 <a class="mypage-user" href="memberinfo.jsp">**(클릭)</a>님 <br>
                    <br>
                    고객님의 회원등급은 <strong>다이아몬드</strong>입니다.
                </div>
                <div class="col-8 border">
                    주문완료 상품 ? 건
                </div>
            </div>
        </div>

        <div style="margin: 40px auto; border-bottom: 7px solid #48372f; width: 500px" class="container-fluid">
            <h3 style="text-align: center; " class="mt-4"> 주문 리스트 </h3>
        </div>


        <table id="orders-table" class="table">

            <thead>
            <tr>
                <th scope="col">주문일자</th>
                <th scope="col">주문상품</th>
                <th scope="col">주문가격</th>
                <th scope="col">주문번호</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <th scope="row">2020/04/04</th>
                <td>상품블라블라</td>
                <td>매우 비싼 가격</td>
                <td>000000</td>
            </tr>
            <tr>
                <th scope="row">2020/04/04</th>
                <td>상품블라블라2</td>
                <td>매우 비싼 가격</td>
                <td>000000</td>
            <tr>
                <th scope="row">2020/04/04</th>
                <td>상품블라블라3</td>
                <td>매우 비싼 가격</td>
                <td>000000</td>
            </tr>
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

