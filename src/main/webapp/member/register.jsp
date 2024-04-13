<%-- 회원 가입 --%>

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
    .input-icon-group input {
        width: 400px;
        height: 40px;
        padding: 10px;
        margin: auto ;
    }
</style>

<body>
<div id="wrapper">
    <!-- header start -->
    <jsp:include page="/module/header.jsp"/>
    <!-- header end -->
    <!-- nav start -->
    <jsp:include page="/module/nav.jsp"/>
    <!-- nav start -->
<%--Contents start--%>
        <div class="container-fluid">

            <div class="bg-pattern text-primary text-opacity-50 opacity-25 w-100 h-100 start-0 top-0 position-absolute"></div>
            <div class="bg-gradientwhite flip-y w-50 h-100 start-50 top-0 translate-middle-x position-absolute"></div>
            <div class="container pt-11 pt-lg-14 pb-9 position-relative z-1">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-6 col-sm-8 mt-3">
                        <h3 style="text-align: center; margin: 50px; font-weight: bold; " > 회원 가입 </h3>


                        <div style="background-color: #48372f; margin: 60px auto; width: 250px" class="width-50x pt-1 mb-10"></div>

                        <div class="position-relative">
                            <div>
                                <form name="register-form" class="needs-validation" novalidate action="register-action.jsp" method="post">
                                    <div class="input-icon-group mb-3">
                                     <span class="input-icon">
                                         <i class="bx bx-user-pin"></i>
                                     </span>
                                        <input type="text" class="form-control" required id="uid" name="id" autofocus placeholder="ID" value="${errors.id}" style="${not empty error.id ? 'color:red' : ''}">
                                    </div>

                                    <div class="input-icon-group mb-3">
                                    <span class="input-icon">
                                         <i class="bx bx-user"></i>
                                     </span>
                                        <input type="text" class="form-control" required id="uname" name="name" autofocus placeholder="NAME"value="${errors.name}" style="${not empty error.name ? 'color:red' : ''}">
                                    </div>

                                    <div class="input-icon-group mb-3">
                                        <span class="input-icon">
                                         <i class="bx bx-envelope"></i>
                                    </span>

                                        <input type="email" class="form-control" required id="email" name="email" placeholder="EMAIL" value="${errors.email}" style="${not empty error.email ? 'color:red' : ''}">
                                    </div>

                                    <div class="input-icon-group mb-3">
                                    <span class="input-icon">
                                     <i class="bx bx-lock-open"></i>
                                     </span>

                                        <input type="password" class="form-control" required id="passwd" name="passwd" placeholder="PASSWORD">
                                    </div>


                                         <div class="input-icon-group mb-3">
                                             <span class="input-icon">
                                                 <i class="bx bx-lock-open"></i>
                                             </span>
                                             <input type="password" class="form-control" required id="re-passwd" name="re-passwd" placeholder="PASSWORD-CHECK">
                                    </div>

                                    <div class="input-icon-group mb-3">
                                             <span class="input-icon">
                                                 <i class="bx bx-lock-open"></i>
                                             </span>
                                        <input type="text" class="form-control" required id="phoneNum" name="phoneNum" placeholder="PHONE-NUMBER">


                                    </div>

                                    <div class="input-icon-group mb-3">
                                             <span class="input-icon">
                                                 <i class="bx bx-lock-open"></i>
                                             </span>
                                        <input type="text" class="form-control" required id="defaultAddress" name="defaultAddress" placeholder="DEFAULT-ADDRESS">
                                    </div>

                                    <div class="input-icon-group mb-3">
                                             <span class="input-icon">
                                                 <i class="bx bx-lock-open"></i>
                                             </span>
                                        <input type="text" class="form-control" required id="detailAddress" name="detailAddress" placeholder="DETAIL-ADDRESS">
                                    </div>

                                    <div class="input-icon-group mb-3">
                                             <span class="input-icon">
                                                 <i class="bx bx-lock-open"></i>
                                             </span>
                                        <input type="text" class="form-control" required id="postNum" name="postNum" placeholder="POST-NUM">
                                    </div>

                                    <div class="d-grid">
                                        <div class="text-center">
                                            <button style="background-color: #48372f; color: white; margin-top: 20px" class="btn" type="submit">가 입 하 기</button>
                                        </div>
                                    </div>

                                </form>

<%--                                <p class="pt-3 small text-body-tertiary">--%>
<%--                                    이미 계정이 있습니까? <a href="/member/login.jsp" class="ms-2 fw-semibold link-underline">로그인</a>--%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%--Contents end--%>
<%--    &lt;%&ndash;    footer start &ndash;%&gt;--%>
<%--    <jsp:include page="/module/footer.jsp"/>--%>
<%--    &lt;%&ndash;    footer end&ndash;%&gt;--%>
 </div>


<%-- Wrapper End--%>


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

