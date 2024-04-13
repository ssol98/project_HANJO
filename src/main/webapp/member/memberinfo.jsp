<%-- 회원 정보 --%>


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
 #my-table{
     margin: 60px auto ;
     width: 900px;
 }
 th {
     background-color: #48372f;
     color: whitesmoke;
     width: 300px;

 }
</style>

<body>
<div class="d-flex" id="wrapper">

    <!-- Page Content -->
    <div id="page-content-wrapper">

        <!-- header start -->
        <jsp:include page="/module/header.jsp"/>
        <!-- header end -->

        <!-- nav start -->
        <jsp:include page="/module/nav.jsp"/>
        <!-- nav start -->

<%--Contents start--%>
        <div style="margin: 40px auto; border-bottom: 7px solid #48372f; width: 500px" class="container-fluid">
            <h3 style="text-align: center; " class="mt-4"> 회원 정보 </h3>
        </div>

            <div style="border: 1px solid wheat; width: 700px; height: 200px" class="container text-center">
                <div class="row align-items-start">
                    <div style="margin: auto auto" class="col">
                        <br>
                        <br>
                        안녕하세요 ${loginMember.name}님 <br>
                        <br>
                        고객님의 회원등급은 <strong style="color: #7abaff">다이아몬드</strong>입니다.
                    </div>
                </div>
            </div>

            <table id="my-table" class="table">


                <tr>
                    <th scope="row">아이디</th>
                    <td>${loginMember.id}</td>
                </tr>

                <tr>
                    <th scope="row">이름</th>
                    <td>${loginMember.name}</td>
                </tr>

                <tr>
                    <th scope="row">주소</th>
                    <td>${loginMember.defaultAddress}</td>
                </tr>

                <tr>
                    <th scope="row">상세주소</th>
                    <td>${loginMember.detailAddress}  우) ${loginMember.postNum}</td>
                </tr>

                <tr>
                    <th scope="row">전화번호</th>
                    <td>${loginMember.phoneNum}</td>
                </tr>

                <tr>
                    <th scope="row">이메일</th>
                    <td>${loginMember.email}</td>
                </tr>

                <tr>
                    <th scope="row">가입일시</th>
                    <td>${loginMember.regdate}</td>
                </tr>


<%--                <tr>--%>
<%--                    <th scope="row">문자 수신 여부</th>--%>
<%--                    <td>--%>
<%--                        <input type="radio" id="m-yes" name="mailSubscription" value="yes">--%>
<%--                        <label for="m-yes">예</label>--%>
<%--                        <input type="radio" id="m-no" name="mailSubscription" value="no">--%>
<%--                        <label for="m-no">아니오</label>--%>
<%--                    </td>--%>
<%--                </tr>--%>

<%--                <tr>--%>
<%--                    <th scope="row">메일 수신 여부</th>--%>
<%--                    <td>--%>
<%--                        <input type="radio" id="e-yes" name="mailSubscription" value="yes">--%>
<%--                        <label for="e-yes">예</label>--%>
<%--                        <input type="radio" id="e-no" name="mailSubscription" value="no">--%>
<%--                        <label for="e-no">아니오</label>--%>
<%--                    </td>--%>
<%--                </tr>--%>

            </table>

        <%--    footer start --%>
        <jsp:include page="/module/footer.jsp"/>
        <%--    footer end--%>
    </div>
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

