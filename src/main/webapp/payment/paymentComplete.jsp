<%-- 결제 완료 창 --%>


<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

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
      width: 40%;
      height: 100%;
      display: inline-block;
    }

    .payInfo-detail-value{
      width: 20%;
      height: 100%;
      display: inline-block;
    }

    .payInfo-detail-value h4{
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
    #homeBtn{
      margin-right: 0.5%;
      width: 10%;
      font-size: large;
    }

    #homeBtn a{
      color: #000;

    }
    #homeBtn:hover{

    }

    /* 마이페이지 버튼 */
    #mypageBtn{
      margin-left: 0.5%;
      width: 10%;
      font-size: large;
    }
    #mypageBtn a{
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
      <h4>주문번호 : </h4>
      <h4>수취인 이름 : </h4>
      <h4>수취인 우편번호 : </h4>
      <h4>수취인 주소 + 상세주소 : </h4>
      <h4>수취인 휴대폰번호 : </h4>
      <h4>배송요청사항 : </h4>
      <h4>주문날짜 : </h4>
    </div>
    <form class="payInfo-detail-value">

    </form>
  </div>

  <!-- 하단 버튼 플렉스 박스 -->
  <div id="rowFlex">
    <button id="homeBtn"><a href="/">홈</a></button>
    <button id="mypageBtn"><a href="../member/memberpage.jsp">마이페이지</a></button>
  </div>
</body>

</html>