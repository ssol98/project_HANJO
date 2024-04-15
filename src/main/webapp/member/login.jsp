<%-- 로그인 --%>

<%@ page import="com.ezen.mall.web.common.encription.EzenUtil" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String referer = (String)request.getAttribute("referer");
	String message = (String)request.getAttribute("message");
	if(referer == null){
		referer = "/";
	}
%>

<!doctype html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>HAN ZO</title>

	<!-- Bootstrap core CSS -->
	<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
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

	<section class="position-relative">
		<div class="bg-pattern text-primary text-opacity-50 opacity-25 w-100 h-100 start-0 top-0 position-absolute">
		</div>
		<div class="container pt-11 pt-lg-14 pb-9 pb-lg-11 position-relative z-1">
			<div class="row align-items-center justify-content-center">
				<div class="col-xl-4 col-lg-5 col-md-6 col-sm-8 z-2">

					<h2 style="text-align: center; padding: 20px 10px" class="mb-1 mt-5 display-6">
						<img src="../img/hanjo_logo_small.png">
					</h2>
					<p class="mb-4 text-body-secondary text -danger">
						${message}
					</p>

					<div class="position-relative">
						<div>
							<form class="needs-validation" action="/member/login-action.jsp" method="post">
								<input type="hidden" name="referer" id="referer" value="<%=referer%>">
								<input type="hidden" name="message" id="referer" value="<%=message%>">
								<%
									// 확인을 위함
//									System.out.println("======밸류에 들어가는 referer값=======");
//									System.out.println("referer:"+referer);
//									System.out.println("===================================");
								%>
								<div class="input-icon-group mb-3">
									<span class="input-icon">
										<i class="bx bx-envelope"></i>
									</span>
									<input type="text" name="loginid" class="form-control" autofocus placeholder="ID" value="${EzenUtil.decription(cookie.saveId.value)}">
								</div>
								<div class="input-icon-group mb-3">
									<span class="input-icon">
										<i class="bx bx-lock-open"></i>
									</span>
									<input type="password" name="loginpw" class="form-control" placeholder="PASSWORD">
								</div>
								<div class="mb-3 d-flex justify-content-between">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="saveid"  id="flexCheckDefault" ${not empty cookie.saveId.value ? "checked" : ""} >
										<label class="form-check-label" for="flexCheckDefault">
											ID 저장
										</label>
									</div>
									<div>
										<label class="text-end d-block small mb-0"><a href="#" class="link-decoration">비밀번호를 잊으셨나요?</a></label>
									</div>
								</div>

								<div class="d-grid">
									<div class="text-center">
										<button style="background-color: #48372f; color: white" class="btn" type="submit">로 그 인</button>
									</div>
								</div>
							</form>

							<!---->
							<p class="pt-4 small text-body-secondary">
								아직 회원이 아니신가요? <a href="../member/register.jsp" class="ms-2 fw-semibold link-underline">회 원 가 입</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<%--    footer start --%>
<jsp:include page="/module/footer.jsp"/>
<%--    footer end--%>
</body>

</html>