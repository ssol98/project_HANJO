<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="member" class="com.ezen.member.dto.Member" scope="session"/>

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
        color: rgba(11,3,0,0.97);
        border-style: none;
        width: 530px;
        height: 50px;
        padding: 10px;
        margin: auto;
        font-weight: bold;
    }


</style>

<body>
<div class="d-flex" id="wrapper">

    <div id="wrapper">
        <!-- header start -->
        <jsp:include page="/module/header.jsp"/>
        <!-- header end -->
        <!-- nav start -->
        <jsp:include page="/module/nav.jsp"/>
        <!-- nav start -->

        <%--Contents start--%>
        <div class="container-fluid">

            <div class="bg-pattern text-primary text-opacity-50 opacity-25 w-100 h-100 start-0 top-0 position-absolute">
            </div>
            <div class="bg-gradientwhite flip-y w-50 h-100 start-50 top-0 translate-middle-x position-absolute"></div>
            <div class="container pt-11 pt-lg-14 pb-9 position-relative z-1">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-6 col-sm-8 mt-3">
                        <h1 style="text-align: center; font-weight: bold; margin: 30px">가입 완료</h1>
                        <p style="text-align: center; color: rgba(27,3,0,0.97); font-size: 10pt">등록하신 정보가 맞는 지 다시 한번 확인하세요</p>


                        <div style="background-color: rgb(123, 62, 39); margin: 15px auto" class="width-50x pt-1 mb-10"></div>

                        <div class="position-relative">
                            <div>
                                    <div class="input-icon-group mb-3">
                                        <span class="input-icon">
                                            <i class="bx bx-user-pin"></i>
                                        </span>
                                        아이디 <input type="text" class="form-control" disabled value="${member.id}">
                                    </div>

                                    <div class="input-icon-group mb-3">
                                        <span class="input-icon">
                                        <i class="bx bx-user"></i>
                                        </span>
                                        이름 <input type="text" class="form-control" disabled value="${member.name}">
                                    </div>

                                    <div class="input-icon-group mb-3">
                                      <span class="input-icon">
                                          <i class="bx bx-envelope"></i>
                                      </span>
                                        </span>
                                        이메일 <input type="text" class="form-control" disabled value="${member.email}">
                                    </div>

                                <div class="input-icon-group mb-3">
                                      <span class="input-icon">
                                          <i class="bx bx-envelope"></i>
                                      </span>
                                    </span>
                                    휴대폰번호 <input type="text" class="form-control" disabled value="${member.phoneNum}">
                                </div>

                                <div class="input-icon-group mb-3">
                                      <span class="input-icon">
                                          <i class="bx bx-envelope"></i>
                                      </span>
                                    </span>
                                    기본주소 <input type="text" class="form-control" disabled value="${member.defaultAddress}">
                                </div>

                                <div class="input-icon-group mb-3">
                                      <span class="input-icon">
                                          <i class="bx bx-envelope"></i>
                                      </span>
                                    </span>
                                    상세주소 <input type="text" class="form-control" disabled value="${member.detailAddress}">
                                </div>

                                <div class="input-icon-group mb-3">
                                      <span class="input-icon">
                                          <i class="bx bx-envelope"></i>
                                      </span>
                                    </span>
                                    우편번호 <input type="text" class="form-control" disabled value="${member.postNum}">
                                </div>

                                    <div class="input-icon-group mb-3">
                                        <span class="input-icon">
                                            <i class="bx bx-lock-open"></i>
                                        </span>
                                        </span>
                                        가입날짜 <input type="text" class="form-control" disabled value="${member.regdate}">
                                    </div>

                                    <form action="/" method="post">
                                <div class="d-grid">
                                    <div class="text-center">
                                        <button style="background-color: #7B3E27; color: white" class="btn" type="submit">메인화면으로</button>
                                    </div>
                                </div>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--Contents end--%>

    </div>
</div>
<%--Wrap End--%>


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

