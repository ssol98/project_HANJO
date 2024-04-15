<%-- 공지사항 --%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HAN ZO</title>

    <link rel="stylesheet" href="/css/board.css">
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
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h1>공지사항</h1>
            <div class="list">
                <div class="list-left">
                    <h3>고객 문의</h3>
                    <div class="list-left-desc">
                        고객님의 소중한 의견을 빠르고<br>
                        정확하게 해결하기 위해 최선을 다하겠습니다.
                    </div>
                </div>
                <div class="list-right">
                    <h3>1999-1999</h3>
                    <div class="list-right-desc">
                        상담시간 AM 9:00 ~ PM 5:30<br>
                        점심시간 PM 12:00 ~ PM 1:00<br>
                        (토/일/공휴일 휴무)
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <div class="search-wrap">
                    <select class="search-type">
                        <option selected value="all">-검색-</option>
                        <option value="t">제목</option>
                        <option value="w">작성자</option>
                    </select>
                    <input placeholder="검색어를 입력해주세요." class="search-text" value="">
                    <button class="btn btn-dark search-btn">검색</button>
                </div>
            </div>
        </div>
    </div>
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-writer">작성자</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-hitcount">조회수</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>10</td>
                    <th><a href="#!">[공지사항]질의응답 게시판 이용 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>9</td>
                    <th><a href="#!">[공지사항]게시판 이용 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>8</td>
                    <th><a href="#!">[공지사항]배송 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>7</td>
                    <th><a href="#!">[공지사항]상품문의 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>6</td>
                    <th><a href="#!">[공지사항]이용방법 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>5</td>
                    <th><a href="#!">[공지사항]질의응답 게시판 이용 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>4</td>
                    <th><a href="#!">[공지사항]게시판 이용 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>3</td>
                    <th><a href="#!">[공지사항]배송 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>2</td>
                    <th><a href="#!">[공지사항]상품문의 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>1</td>
                    <th><a href="#!">[공지사항]이용방법 관련</a></th>
                    <td>[관리자]</td>
                    <td>2024.04.07</td>
                    <td>1</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="page">
        <ul class="pagination modal">
            <li><a href="#" class="first">처음</a></li>
            <li><a href="#" class="back">이전</a></li>
            <li><a href="#" class="active num">1</a></li>
            <li><a href="#" class="num">2</a></li>
            <li><a href="#" class="num">3</a></li>
            <li><a href="#" class="num">4</a></li>
            <li><a href="#" class="num">5</a></li>
            <li><a href="#" class="next">다음</a></li>
            <li><a href="#" class="last">마지막</a></li>
        </ul>
    </div>
</section>
</div>
<%-- footer start --%>
<jsp:include page="/module/footer.jsp"/>
<%-- footer end --%>
</body>
</html>